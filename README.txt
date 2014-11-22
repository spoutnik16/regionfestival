wtf all over the place
well salut !
post receive hook on prod server
very cool form : http://codepen.io/rexkirby/pen/Fdnlz



install postgis + geodajango

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.3 pgadmin3 postgresql-contrib postgresql-9.3-postgis-2.1 pgadmin3 postgresql-contrib -y

