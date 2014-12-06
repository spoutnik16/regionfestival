from django.conf import settings
import yaml
from urllib.request import urlopen
from xml.etree import ElementTree as ET
from regionfestival import settings
from django.contrib.gis.geos import GEOSGeometry, MultiPolygon

from associations.models import Region, RegionChild, RegionChild2


class ImportDFI:
    @staticmethod
    def loadyml(file):
        return yaml.load(open(settings.BASE_DIR + '/associations/imports/' + file))
    def importall(self):
        self.importcommunes()
        self.importwktcommunes()
        self.importwktdistricts()
        self.importwktcanton()

    def importcommunes(self):
        changes_commune = False
        if not Region.objects.filter(name__in=['valais', 'Valais']).exists():
            valais = Region(name='Valais')
            valais.save()
            changes_commune = True
        valais = Region.objects.get(name__in=['valais', 'Valais'])
        base = self.loadyml('communes.yml')
        for commune in base:
            if not RegionChild.objects.filter(name__in=[commune['district'].lower(), commune['district']]).exists():
                child = RegionChild(name=commune['district'].lower(), region=valais)
                child.save()
                print('district ' + child.name + ' sauve')
                changes_commune = True
            child = RegionChild.objects.get(name=commune['district'].lower())
            if not RegionChild2.objects.filter(name__in=[commune['commune'], commune['commune'].capitalize()]).exists():
                commune = RegionChild2(name=commune['commune'].lower(), order=commune['order'], region_child=child)
                commune.save()
                print('commune ' + commune.name + ' sauvee')
                changes_commune = True
        return changes_commune

    def importwktcommunes(self):

        j = 0
        communes_text_save = 'communes sauvées'
        communes_text_error = 'communes pas sauvées'
        communes_errors = {}
        # sion : 2757528 champéry : 1685287, st-maurice : 2757524
        for i in range(1685264, 1685408):
            try:
                name_data = urlopen('http://www.openstreetmap.org/api/0.6/relation/' + str(i)).read().decode('utf-8')
                doc = ET.fromstring(name_data)
                name = doc[0].findall('tag')[2].attrib['v'].replace('(VS)', '').replace(' ', '')
                wkt_data = urlopen('http://polygons.openstreetmap.fr/get_wkt.py?id=' + str(i) + "&params=0").read().decode('utf-8')
                path = settings.BASE_DIR + '/associations/imports/geo/regionchild2/' + name.lower() + '.wkt'
                file = open(path, 'w+')
                file.write(wkt_data)
                file.close()
                boundaries = GEOSGeometry(wkt_data)
                if not isinstance(boundaries, MultiPolygon):
                    boundaries = MultiPolygon(GEOSGeometry(wkt_data))
            except:
                pass
            else:
                if RegionChild2.objects.filter(name__in=[name.lower(), name]).exists():
                   # TODO : les communes sont en capitalize maintenant
                    reg = RegionChild2.objects.get(name__in=[name.lower(), name])

                    reg.boundaries = boundaries
                    print('on sauverait la commune ' + str(reg.name) + ' avec le fichier ' + path)
                    print('on changerait le nom de la commune de ' + str(reg.name) + ' pour ' + name)
                    communes_text_save += ', ' + name
                    reg.name = name
                    reg.save()
                    j += 1
                else:
                    print('La commune ' + name + ' ne se trouve pas dans la bdd, prière de le faire à la main')
                    communes_errors[name] = {'boundaries' : boundaries, 'name' : name, 'file' : file, 'path' : path}
                    communes_text_error += ', ' + name

    def importwktdistricts(self):

        j = 0
        districts_text_save = 'districts sauvées'
        districts_text_error = 'districts pas sauvées'
        districts_errors = {}
        # raron = 1686698 et 1686712
        for i in range(1686698, 1686713):
            try:
                name_data = urlopen('http://www.openstreetmap.org/api/0.6/relation/' + str(i)).read().decode('utf-8')
                doc = ET.fromstring(name_data)
                name = doc[0].findall('tag')[2].attrib['v'].replace('(VS)', '').replace(' ', '')
                wkt_data = urlopen('http://polygons.openstreetmap.fr/get_wkt.py?id=' + str(i) + "&params=0").read().decode('utf-8')
                path = settings.BASE_DIR + '/associations/imports/geo/regionchild/' + name.lower() + '.wkt'
                file = open(path, 'w+')
                file.write(wkt_data)
                file.close()
                boundaries = GEOSGeometry(wkt_data)
                if not isinstance(boundaries, MultiPolygon):
                    boundaries = MultiPolygon(GEOSGeometry(wkt_data))
            except:
                pass
            else:
                if RegionChild.objects.filter(name__in=[name.lower(), name]).exists():
                    reg = RegionChild.objects.get(name__in=[name.lower(), name])

                    reg.boundaries = boundaries
                    print('on sauverait la commune ' + str(reg.name) + ' avec le fichier ' + path)
                    print('on changerait le nom de la commune de ' + str(reg.name) + ' pour ' + name)
                    districts_text_save += ', ' + name
                    reg.name = name
                    reg.save()
                    j += 1
                else:
                    print('La commune ' + name + ' ne se trouve pas dans la bdd, prière de le faire à la main')
                    districts_errors[name] = {'boundaries' : boundaries, 'name' : name, 'file' : file, 'path' : path}
                    districts_text_error += ', ' + name

    #fonction pour ajouter un wkt à la main avec un objet
    def alamain(self, region, wkt_names):
        path = settings.BASE_DIR + '/associations/imports/geo/' + region.__class__.__name__.lower() + '/'
        multipoly = None
        for wkt_name in wkt_names:
            wkt_datas = open(path + wkt_name, 'r').read()
            poly = GEOSGeometry(wkt_datas)
            if not isinstance(poly, MultiPolygon):
                poly = MultiPolygon(poly)
            if multipoly is None:
                multipoly = poly
            else:
                multipoly += poly
        region.boundaries = multipoly
        region.save()






    def importwktcanton(self):

        j = 0
        districts_text_save = 'districts sauvées'
        districts_text_error = 'districts pas sauvées'
        districts_errors = {}
        for i in range(1686699, 1686700):
            try:
                name_data = urlopen('http://www.openstreetmap.org/api/0.6/relation/' + str(i)).read().decode('utf-8')
                doc = ET.fromstring(name_data)
                name = doc[0].findall('tag')[2].attrib['v'].replace('(VS)', '').replace(' ', '')
                name = 'Valais'
                wkt_data = urlopen('http://polygons.openstreetmap.fr/get_wkt.py?id=' + str(i) + "&params=0").read().decode('utf-8')
                path = settings.BASE_DIR + '/associations/imports/geo/regionchild/' + name.lower() + '.wkt'
                file = open(path, 'w+')
                file.write(wkt_data)
                file.close()
                boundaries = GEOSGeometry(wkt_data)
                if not isinstance(boundaries, MultiPolygon):
                    boundaries = MultiPolygon(GEOSGeometry(wkt_data))
            except:
                pass
            else:
                if Region.objects.filter(name__in=[name.lower(), name]).exists():
                    reg = Region.objects.get(name__in=[name.lower(), name])
                    # TODO : les communes sont en capitalize maintenant

                    reg.boundaries = boundaries
                    print('on sauverait la commune ' + str(reg.name) + ' avec le fichier ' + path)
                    print('on changerait le nom de la commune de ' + str(reg.name) + ' pour ' + name)
                    districts_text_save += ', ' + name
                    reg.name = name
                    reg.save()
                    j += 1
                else:
                    print('La commune ' + name + ' ne se trouve pas dans la bdd, prière de le faire à la main')
                    districts_errors[name] = {'boundaries' : boundaries, 'name' : name, 'file' : file, 'path' : path}
                    districts_text_error += ', ' + name
