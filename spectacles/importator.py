from urllib.request import urlopen

from django.core.files import File
from django.core.files.temp import NamedTemporaryFile
from django.template.defaultfilters import slugify
from django.conf import settings
import yaml

from spectacles.models import *
from associations.models import RegionChild2, Association, CategorieAssociation


class ImportDFI:
    def importall(self):
        # self.importcommunes()
        self.importplaces()
        self.importcategoriesspectacle()
        self.importcategoriesassociation()
        self.importspectacles()
        self.importrepresentations()
        self.importimages()

    @staticmethod
    def loadyml(file):
        return yaml.load(open(settings.BASE_DIR + '/spectacles/imports/' + file))

    # def importcommunes(self):
    # changes_commune = False
    # if not Region.objects.filter(name='valais').exists():
    #         valais = Region(name='valais')
    #         valais.save()
    #         changes_commune = True
    #     valais = Region.objects.get(name='valais')
    #     base = self.loadyml('communes.yml')
    #     for commune in base:
    #         if not RegionChild.objects.filter(name=commune['district'].lower()).exists():
    #             child = RegionChild(name=commune['district'].lower(), region=valais)
    #             child.save()
    #             print('district ' + child.name + ' sauvé')
    #             changes_commune = True
    #         child = RegionChild.objects.get(name=commune['district'].lower())
    #         if not RegionChild2.objects.filter(name=commune['commune']).exists():
    #             commune = RegionChild2(name=commune['commune'].lower(), order=commune['order'], region_child=child)
    #             commune.save()
    #             print('commune ' + commune.name + ' sauvée')
    #             changes_commune = True
    #     return changes_commune

    def importplaces(self):
        changes_places = False
        base = self.loadyml('places.yml')
        communes = self.loadyml('communes.yml')
        for place in base:
            if not Lieu.objects.filter(old_id=place['id']):
                commune_name = [element for element in communes if element['id'] == place['commune']][0]
                regionchild = RegionChild2.objects.filter(name=commune_name['commune'].lower()).first()
                if 'coordonnes' in place:
                    coordonnees = place['coordonnees'].split(',')
                else:
                    coordonnees = ['0', '0']
                if 'status' in place:
                    status = place['status']
                else:
                    status = '0'
                lieu = Lieu(name=place['name'],
                            adress=place['adresse'],
                            lat=coordonnees[0],
                            long=coordonnees[1],
                            zipCode=place['codePostal'],
                            city=place['ville'],
                            adress2=place['adresse2'],
                            status=status,
                            region=regionchild,
                            old_id=place['id'])
                lieu.save()
                print('lieu ' + lieu.name + ' sauvé')
                changes_places = True
        return changes_places

    def importcategoriesspectacle(self):
        categories = self.loadyml('categories.yml')
        for categorie in categories:
            self.importcategoriespectacle(categorie, categories)

    def importcategoriespectacle(self, categorie, categories):
        if not CategorieSpectacle.objects.filter(name=categorie['name']):
            cat = CategorieSpectacle(name=categorie['name'])
            cat.slug = slugify(cat.name)
            parentid = int(categorie['parentId'])
            if parentid > 0:
                parent = [element for element in categories if int(element['id']) == parentid][0]
                if not CategorieSpectacle.objects.filter(name=parent['name']):
                    parent = self.importcategoriespectacle(parent, categories)
                else:
                    parent = CategorieSpectacle.objects.filter(name=parent['name']).first()
                cat.parent = parent
            cat.save()
            print('catégorie ' + cat.name + ' sauvée')
            return cat
        return CategorieSpectacle.objects.filter(name=categorie['name']).first()

    def importcategoriesassociation(self):
        categories = self.loadyml('categories.yml')
        for categorie in categories:
            self.importcategorieassociation(categorie, categories)

    def importcategorieassociation(self, categorie, categories):
        if not CategorieAssociation.objects.filter(name=categorie['name']):
            cat = CategorieAssociation(name=categorie['name'])
            cat.slug = slugify(cat.name)
            parentid = int(categorie['parentId'])
            if parentid > 0:
                parent = [element for element in categories if int(element['id']) == parentid][0]
                if not CategorieAssociation.objects.filter(name=parent['name']):
                    parent = self.importcategorieassociation(parent, categories)
                else:
                    parent = CategorieAssociation.objects.filter(name=parent['name']).first()
                cat.parent = parent
            cat.save()
            print('catégorie ' + cat.name + ' sauvée')
            return cat
        return CategorieAssociation.objects.filter(name=categorie['name']).first()

    def importspectacles(self):
        spectacles = self.loadyml('spectacles.yml')
        categories = self.loadyml('categories.yml')
        for spectacle in spectacles:
            if not Spectacle.objects.filter(old_id=int(spectacle['id'])):
                self.importspectacle(spectacle, spectacles, categories)

    def importspectacle(self, spectacle, spectacles, categories):
        cat_id = int(spectacle['categorie'])
        categorie_dic = [e for e in categories if int(e['id']) == cat_id][0]
        categorie = CategorieSpectacle.objects.filter(name=categorie_dic['name']).first()
        s = Spectacle(name=spectacle['name'],
                      presentation_cahier=spectacle['presentationCahier'],
                      status=spectacle['status'],
                      categorie=categorie,
                      website=spectacle['website'],
                      old_id=spectacle['id'], )
        s.save()
        if spectacle['parent'] > 0:
            if not Spectacle.objects.filter(old_id=spectacle['parent']):
                parentid = int(spectacle['parent'])
                parent = [e for e in spectacles if int(e['id']) == parentid][0]
                print('on va enregistrer le parent')
                return self.importspectacle(parent, spectacles, categories)
            else:
                parent = Spectacle.objects.filter(old_id=spectacle['parent']).first()
                print('parent trouvé : ' + parent.name)
            s.parent.add(parent)
        print('spectacle ' + s.name + ' sauvé')
        self.importasso(spectacle['compagnie'], s, categories)
        return s

    def importimages(self):
        spectacles = self.loadyml('spectacles.yml')
        for spectacle in spectacles:
            if spectacle['images']:
                s = Spectacle.objects.get(old_id=spectacle['id'])
                image_dic = spectacle['images'].split('&&')
                image = image_dic[0]
                image_filename = image.replace('&', '')
                image_url = 'http://www.valaisfestival.ch/web/uploads/' + image_filename
                print(image_url)
                img_temp = NamedTemporaryFile(delete=True)
                try:
                    img_temp.write(urlopen(image_url).read())
                except:
                    pass
                else:
                    img_temp.flush()
                    img_name = slugify(s.name) + '_' + str(s.pk) + '.jpg'
                    img_name = img_name[:50]
                    s.photo.save(img_name, File(img_temp))
                    s.save()
                    print('image ' + img_name + ' sauvée')

    @staticmethod
    def importasso(asso_name, spectacle, categories):
        associations = asso_name.split(',')
        for asso_name in associations:
            asso_name = asso_name.strip()
            if Association.objects.filter(name=asso_name):
                a = Association.objects.filter(name=asso_name).first()
            else:
                a = Association(name=asso_name)
                cat_dic = [e for e in categories if e['name'] == spectacle.categorie.name][0]
                categorie = CategorieAssociation.objects.filter(name=cat_dic['name']).first()
                a.categorie = categorie
                a.save()
                print('association ' + a.name + ' sauvée')
            spectacle.associations.add(a)
            # TODO ajouter la region_child_2
            spectacle.save()

    def importrepresentations(self):
        representations = self.loadyml('repkeresentations.yml')
        spectacles = self.loadyml('spectacles.yml')
        lieux = self.loadyml('places.yml')
        for representation in representations:
            spectacleid = int(representation['idSpectacle'])
            spectacle_dic = [e for e in spectacles if int(e['id']) == spectacleid]
            if spectacle_dic:
                spectacle = Spectacle.objects.get(old_id=representation['idSpectacle'])
                idlieu = int(spectacle_dic[0]['place'])
                lieu_dic = [e for e in lieux if int(e['id']) == idlieu]
                if lieu_dic:
                    lieu = Lieu.objects.get(old_id=spectacle_dic[0]['place'])
                    representation = Representation(status=0,
                                                    datetime=representation['debut'])
                    representation.lieu = lieu
                    representation.spectacle = spectacle
                    representation.save()
                    print(
                        'representation du spectacle ' + spectacle.name + ' au ' + lieu.name + ' le ' +
                        str(representation.datetime) + ' sauvée')