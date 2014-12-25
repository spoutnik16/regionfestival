__author__ = 'spoutnik16'
import xml.etree.ElementTree as ET
import re
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from associations.models import *
from urllib.request import urlopen
from django.contrib.gis.geos import GEOSGeometry
import json

def importchoeursET():
    tree = ET.parse('associations/imports/html/chanter.ch.html')
    tbody = tree.getroot()[0][0][0]
    list_nom_inutiles = ('Kirchenchor', 'Choeur mixte', 'Kinderchor', 'Jugendchor', 'Männerchor',
	'Chœur-Mixte', 'Gemischter Chor', "Chœur d'Enfants", 'Choeur des Jeunes', 'Chörli', 'Frauenchor')
    for row1, row2 in zip(*[iter(tbody)]*2):
        titre = row1[0]tensité de "l'oubli des anges" en Avignon en 2013, je ne voulais surtout pas louper Teruel à Paris. J'ai encore été bluffée/soufflée par la performance des 2 danseuses. En revanche la mise en scène souffr.text
        if titre in list_nom_inutiles:
            titre += ' '+row1[1].text[5:]
        nom_president = 'a'
    return True
    
def importchoeur_json_reg(row1, choeur):
    try:
        addr = urlopen('https://maps.googleapis.com/maps/api/geocode/json?address='+swisse_allemand(row1[1][0].replace(' ', '%20'))).read().decode('utf-8').replace('\n', '')
        addr_json = json.loads(addr)
        lat = addr_json['results'][0]['geometry']['location']['lat']
        lng = addr_json['results'][0]['geometry']['location']['lng']
 #       print(str(lat)+'  '+str(lng))
 #       print(choeur.name + ' -> '+row1[1][0])
        point = GEOSGeometry('POINT(%s %s)' % (str(lng), str(lat)))
        try:
            reg = RegionChild2.objects.get(boundaries__contains=point)
 #           print('commune de ' +str(reg.name))
            choeur.region_child_2 = reg
        except:
 #           print('pas trouvé de commune')
            pass
    except:
        pass
    return (choeur)


def importchoeur_json_name(row1, choeur):
    list_nom_inutiles = ('Kirchenchor', 'Choeur mixte', 'Kinderchor', 'Jugendchor',
         'Männerchor','Chœur-Mixte', 'Gemischter Chor', "Chœur d'Enfants", 'Choeur des Jeunes',
         'Chörli', 'Frauenchor')
    if row1[0][0] in list_nom_inutiles:
        choeur.name = row1[0][0] +' '+row1[1][0][5:]
    else:
        choeur.name = row1[0][0]
    return choeur

def importchoeur_json_pres(row1, row2, choeur):
    if row1[2][0] is not '':
        president = Person()
        president.first_name = row1[2][0].split(' ')[0]
        president.last_name = row1[2][0].split(' ')[1]
        for mail in row2[3]:
            if validateEmail(mail):
                president.mail = mail
                row2[3].remove(mail)
        for phone in row2[3]:
            if phone.startswith('Tél.: '):
                president.telephone = phone[6:]
                # print('tel : '+president.telephone)
                row2[3].remove(phone)
            elif phone.startswith('Natel : '):
                president.cellphone = phone[8:]
                # print('natel : '+president.cellphone)
                row2[3].remove(phone)
            elif phone.startswith('Fax : '):
                print('fax')
                row2[3].remove(phone)
        print(president.first_name[:10].ljust(10)+president.last_name[:10].ljust(10)+
        president.telephone[:10].ljust(10)+president.mail[:30].ljust(30))
        return choeur

def importchoeur_json():
    file = open('associations/imports/html/chanter.ch.json')
    table = json.load(file)
    chorale = CategorieAssociation.objects.get(name='Chorale')
    for row1, row2 in zip(*[iter(table)]*2):
        choeur = Association()
        choeur.categorie = chorale
        choeur = importchoeur_json_name(row1, choeur)
#        print(choeur.name + ' -> '+row1[1][0])
        choeur = importchoeur_json_reg(row1, choeur)
        choeur = importchoeur_json_pres(row1, row2, choeur)



def swisse_allemand(stringa):
    swiss_allemand = {'ö' : 'oe', 'ä': 'ae', 'ü': 'ue'}
    for a, b in swiss_allemand.items():
        stringa = stringa.replace(a, b)
    return stringa
                        
                
   
               
def validateEmail(mail):
    try:
        validate_email(mail)
        return True
    except ValidationError:
        return False


def importchoeur_regex():
    file = open('associations/imports/html/chanter.ch.html').read()
    white_space_regex = re.compile('[\s]{2,}')
    tr_split_regex = re.compile('</tr>')
    i=0
    for row in file.split('<tr class="tblch">')[1:]:
        try:
            i+=1
            row = row.replace('\n', '')
            row = white_space_regex.sub('', row)
            rowx = re.split('<\/tr><tr id="showdetail[\n]+">', row)
            row1 = rowx[1]
            row0 = rowx[0][4:]
            [choeur_name, suite] = row0[4:].split('</td>', 1)
            [choeur_village, suite] = suite.split('</td>', 1)
            print(choeur_name + ' -> ' + choeur_village)
        except:
            print('bug @ '+str(i))
            pass


