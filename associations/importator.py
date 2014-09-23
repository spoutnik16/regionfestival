from associations.models import Region, RegionChild, RegionChild2


class ImportDFI:
    def loadYML(self, file):
        return self.yaml.load(open(self.settings.BASE_DIR + '/associations/' + file))

    def importcommunes(self):
        changes_commune = False
        if not Region.objects.filter(name='valais').exists():
            valais = Region(name='valais')
            valais.save()
            changes_commune = True
        valais = Region.objects.get(name='valais')
        base = self.loadYML('communes.yml')
        for commune in base:
            if not RegionChild.objects.filter(name=commune['district'].lower()).exists():
                child = RegionChild(name=commune['district'].lower(), region=valais)
                child.save()
                print('district ' + child.name + ' sauve')
                changes_commune = True
            child = RegionChild.objects.get(name=commune['district'].lower())
            if not RegionChild2.objects.filter(name=commune['commune']).exists():
                commune = RegionChild2(name=commune['commune'].lower(), order=commune['order'], region_child=child)
                commune.save()
                print('commune ' + commune.name + ' sauvee')
                changes_commune = True
        return changes_commune