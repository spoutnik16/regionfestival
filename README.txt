wtf all over the place
well salut !
post receive hook on prod server
very cool form : http://codepen.io/rexkirby/pen/Fdnlz



install postgis + geodajango

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get install python==3.4
sudo apt-get install pip3
sudo apt-get install postgresql==9.3 postgresql-contrib -y
sudo apt-get install postgresql-0.3-postgis-2.1 -<
sudo pip3 install -r < requirements.txt
python3 manage.py shell
# from associations.moderator import *
# ImportDFI().importcommunes()
# from spectacles.moderator import *
# ImportDFI().importall()
