wtf all over the place
well salut !
post receive hook on prod server
very cool form : http://codepen.io/rexkirby/pen/Fdnlz


# TODO : function spectacle.views : def get closerspectacles(request): return list_spectacles
# TODO : pour chaque fonction qui veut sa box : close_spectacles = closerspectacles(request)

#TODO :
# from django.contrib.gis.measure import D
# hacienda = Lieu.objects.get(name="L'Hacienda")
# Lieu.objects.filter(in_geom__distance_lt=(hacienda.in_geom, D(m=2000))).distance(hacienda.in_geom).order_by('distance')
# Representation.objects.filter(lieu__in_geom__distance_lte=(hacienda.in_geom, D(m=2000)))
# sierre = RegionChild2.objects.get(name='Sierre')
# Lieu.objects.filter(in_geom__within=sierre.boundaries)
# RegionChild2.objects.get(boundaries__contains=hacienda.in_geom)


install postgis + geodajango

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get install python==3.4
sudo apt-get install pip3
sudo apt-get install postgresql==9.3 postgresql-contrib -y
sudo apt-get install postgresql-0.3-postgis-2.1 -y
sudo -u postgres psql


DROP DATABASE valaisfestival;
CREATE DATABASE valaisfestival;
GRANT ALL PRIVILEGES ON DATABASE valaisfestival TO valaisfestival;
\c valaisfestival;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis_tiger_geocoder;
\q
python3 manage.py syncdb

# and now we create postgis template for the database
sudo pip3 install -r < requirements.txt
python3 manage.py shell
# from associations.moderator import *
# ImportDFI().importall()
# from spectacles.moderator import *
# ImportDFI().importall()
