import json
from urllib.request import urlopen
import re

from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.contrib.gis.geos import GEOSGeometry

from associations.models import *

def importfanfare():
    categorie = CategorieAssociation.objects.get(name__icontains='fanfare')
    file = open('associations/imports/html/ascmv.ch.json')
    table = json.load(file)
    i=0
    for row in table:
        i+=1
        print(str(i).ljust(4), end=':')
        fanfare = getname(row[0][0][0].title(), row)
        fanfare.categorie=categorie
        fanfare = getregion(fanfare, row)
        (fanfare, president, contact_pres) = importpersonne(fanfare, row[1][1])
        (fanfare, directeur, contact_pres) = importpersonne(fanfare, row[1][2])
        print(fanfare.website)


def getname(name, row):
    if len(Association.objects.filter(name__icontains=name.lower(), categorie__name__icontains='fanfare'))>0:
        fanfare = Association.objects.filter(name__icontains=name.lower(), categorie__name__icontains='fanfare')[0]
        # print('existe')
    else:
        fanfare = Association(name=name)
        # print('existe pas')
    try:
        fanfare.website =row[1][0][1]
    except:
        pass
    return fanfare

def getregion(fanfare, row):
    region_name = row[0][1][0]+'%20Valais'
    try:
        url =  'https://maps.googleapis.com/maps/api/geocode/json?address=' + swisse_allemand(region_name)
        # print(url)
        addr = urlopen(url).read().decode('utf-8').replace('\n', '')
        # print(addr)
        addr_json = json.loads(addr)
        lat = addr_json['results'][0]['geometry']['location']['lat']
        lng = addr_json['results'][0]['geometry']['location']['lng']
        # print(lat, lng)
        point = GEOSGeometry('POINT(%s %s)' % (str(lng), str(lat)))
        try:
            reg = RegionChild2.objects.get(boundaries__contains=point)
            # print('commune de ' +str(reg.name))
            fanfare.region_child2 = reg
            # print(reg)
        except:
            # print('pas trouvé de commune')
            pass
    except:
        pass
    return fanfare

def importpersonne(fanfare, row1):
    role = row1[0]
    name2 = re.sub('([a-zé]{1})([A-Z]{1})', '\g<1> \g<2>', row1[1])
    first_name2 = name2.split(' ')[0]
    last_name2 = name2.split(' ')[1]
    # print(first_name2.ljust(15), end='')
    # print(last_name2.ljust(15), end='')
    if len(Person.objects.filter(first_name=first_name2, last_name=last_name2))>0:
        person = Person.objects.filter(first_name=first_name2, last_name=last_name2)[0]
    else:
        person = Person(first_name=first_name2, last_name=last_name2)
    person.adresse = row1[2]+', '+row1[3][:4]+' '+row1[3][4:]
    for line in row1:
        if line.startswith('07'):
            person.cellphone=line
        elif line.startswith('02'):
            person.telephone=line
        elif validateEmail(line):
            person.mail=line
    # print(person.mail)
    person.save()
    fanfare.save()
    if len(Contact.objects.filter(association=fanfare, person=person))>0:
        contact=Contact.objects.filter(association=fanfare, person=person)[0]
        contact.role = role
        contact.save()
    else:
        contact = Contact(association=fanfare, person=person, role=role)
        contact.save()
    return fanfare, person, contact
    
    

def swisse_allemand(stringa):
    swiss_allemand = {'ö': 'oe', 'ä': 'ae', 'ü': 'ue', 'é' : 'e', 'à' : 'a', 'è' : 'e', 'ê' : 'e'}
    for a, b in swiss_allemand.items():
        stringa = stringa.replace(a, b)
    return stringa


def validateEmail(mail):
    try:
        validate_email(mail)
        return True
    except ValidationError:
        return False
