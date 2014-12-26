__author__ = 'spoutnik16'


# Documentation : Just copy past that in a manage.py shell, and run importchoeur_json()


from urllib.request import urlopen
import json

from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.contrib.gis.geos import GEOSGeometry

from associations.models import *


def importchoeur_json_reg(row1, choeur):
    try:
        addr = urlopen('https://maps.googleapis.com/maps/api/geocode/json?address=' + swisse_allemand(
            row1[1][0].replace(' ', '%20'))).read().decode('utf-8').replace('\n', '')
        addr_json = json.loads(addr)
        lat = addr_json['results'][0]['geometry']['location']['lat']
        lng = addr_json['results'][0]['geometry']['location']['lng']
        # print(str(lat)+'  '+str(lng))
        # print(choeur.name + ' -> '+row1[1][0])
        point = GEOSGeometry('POINT(%s %s)' % (str(lng), str(lat)))
        try:
            reg = RegionChild2.objects.get(boundaries__contains=point)
            # print('commune de ' +str(reg.name))
            choeur.region_child2 = reg
            print(reg)
        except:
            # print('pas trouvé de commune')
            pass
    except:
        pass
    return choeur


def importchoeur_json_name(row1, choeur):
    list_nom_inutiles = ('Kirchenchor', 'Choeur mixte', 'Kinderchor', 'Jugendchor',
                         'Männerchor', 'Chœur-Mixte', 'Gemischter Chor', "Chœur d'Enfants", 'Choeur des Jeunes',
                         'Chörli', 'Frauenchor')
    if row1[0][0] in list_nom_inutiles:
        choeur.name = row1[0][0] + ' ' + row1[1][0][5:]
    else:
        choeur.name = row1[0][0]
    try:
        choeur2 = Association.objects.get(name=choeur.name)
        choeur = choeur2
        # print('doublon')
    except:
        pass
    descr = '. '.join(row2[2])
    if not choeur.description:
        choeur.description = descr
    return choeur


def importchoeur_json_pres(row1, row2, choeur):
    if row1[2][0] is not '':
        president = Person()
        president.first_name = row1[2][0].split(' ')[0]
        president.last_name = row1[2][0].split(' ')[1]
        if len(Person.objects.filter(first_name=president.first_name).filter(last_name=president.last_name)) > 0:
            president = Person.objects.filter(first_name=president.first_name).filter(last_name=president.last_name)[0]
            role = row2[3][0]
            # print('doublon')
        else:
            president.mail = ''
            president.telephone = ''
            president.cellphone = ''
            president.adresse = ''
            for mail in row2[3]:
                if validateEmail(mail):
                    president.mail = mail
                    row2[3].remove(mail)
            for phone in reversed(row2[3]):
                if phone.startswith('Tél.: '):
                    president.telephone = phone[6:]
                    # print('tel : '+president.telephone)
                    row2[3].remove(phone)
                elif phone.startswith('Natel : '):
                    president.cellphone = phone[8:]
                    # print('natel : '+president.cellphone)
                    row2[3].remove(phone)
                elif phone.startswith('Fax : '):
                    # print('fax')
                    row2[3].remove(phone)
            role = row2[3][0]
            row2[3].remove(role)
            president.adresse = ' '.join(row2[3])
        # print(president.first_name[:10].ljust(10)+president.last_name[:10].ljust(10)+
        # president.telephone[:10].ljust(10)+president.mail[:30].ljust(30))
        president.save()
        contact = Contact(association=choeur, person=president, role=role)
        return (choeur, contact, president)
    else:
        return (choeur, False, False)


def importchoeur_json_dir(row1, row2, choeur):
    if row1[3][0] is not '':
        directeur = Person()
        directeur.first_name = row1[3][0].split(' ')[0]
        directeur.last_name = row1[3][0].split(' ')[1]
        if len(Person.objects.filter(first_name=directeur.first_name).filter(last_name=directeur.last_name)) > 0:
            directeur = Person.objects.filter(first_name=directeur.first_name).filter(last_name=directeur.last_name)[0]
            role = row2[3][0]
            # print('doublon')
        else:
            directeur.mail = ''
            directeur.telephone = ''
            directeur.cellphone = ''
            directeur.adresse = ''
            for mail in row2[4]:
                if validateEmail(mail):
                    directeur.mail = mail
                    row2[4].remove(mail)
            for phone in reversed(row2[4]):
                if phone.startswith('Tél.: '):
                    directeur.telephone = phone[6:]
                    # print('tel : '+president.telephone)
                    row2[4].remove(phone)
                elif phone.startswith('Natel : '):
                    directeur.cellphone = phone[8:]
                    # print('natel : '+president.cellphone)
                    row2[4].remove(phone)
                elif phone.startswith('Fax : '):
                    # print('fax')
                    row2[4].remove(phone)
            role = row2[4][0]
            row2[4].remove(role)
            directeur.adresse = ' '.join(row2[4])
        directeur.save()
        # print(president.first_name[:10].ljust(10)+president.last_name[:10].ljust(10)+
        # president.telephone[:10].ljust(10)+president.mail[:30].ljust(30))
        contact = Contact(association=choeur, person=directeur, role=role)
        return (choeur, contact, directeur)
    else:
        return (choeur, False, False)


def importchoeur_json():
    file = open('associations/imports/html/chanter.ch.json')
    table = json.load(file)
    chorale = CategorieAssociation.objects.get(name='Chorale')
    i = 0
    for row1, row2 in zip(*[iter(table)] * 2):
        choeur = Association()
        choeur.categorie = chorale
        choeur = importchoeur_json_name(row1, choeur)
        choeur = importchoeur_json_reg(row1, choeur)
        (choeur, contact_pres, president) = importchoeur_json_pres(row1, row2, choeur)
        (choeur, contact_dir, directeur) = importchoeur_json_dir(row1, row2, choeur)
        # print('  ')
        # print (str(i).ljust(3), end=" : ")
        # follow = False
        # try:
        # print(str(choeur.name).ljust(30), end=' -> ')
        # print(str(choeur.region_child2).ljust(30), end=' / ')
        # if directeur.last_name:
        # print(str(directeur).ljust(30), end=" (")
        # print(str(directeur.telephone).ljust(15), end='), ')
        # follow = True
        # if president.last_name:
        # print(str(president).ljust(30), end=" (")
        # print(str(directeur.telephone).ljust(15), end=') ')
        # if follow:
        # j += 1
        # except:
        # #     pass
        # if president:
        # print(str(contact_pres.association.name))
        # if directeur:
        # directeur.save()
        # contact_directeur.save()
        choeur.save()
        i += 1
        # print(str(i) + ' : ' + str(choeur))
        if president:
            contact_pres.association = choeur
            contact_pres.save()
            i += 1
            # print(str(i) + ' : ' + str(contact_pres))
        if directeur:
            contact_dir.association = choeur
            contact_dir.save()
            # print(str(i) + ' : ' + str(contact_dir))
    return i


def swisse_allemand(stringa):
    swiss_allemand = {'ö': 'oe', 'ä': 'ae', 'ü': 'ue'}
    for a, b in swiss_allemand.items():
        stringa = stringa.replace(a, b)
    return stringa


def validateEmail(mail):
    try:
        validate_email(mail)
        return True
    except ValidationError:
        return False

