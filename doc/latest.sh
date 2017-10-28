#!/bin/bash
# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Ramesh Jha (rameshjha420@gmail.com),(http://blog.sudobits.com)
# License: MIT
# Installing Dependencies
echo ".......Updating package cache & upgrade system....."
sudo apt-get update
sudo apt-get -y upgrade
echo "......Done.........."

echo "..........Installing git & subversion.........."
sudo apt-get -y install git subversion
echo "..........Done...................."

echo "..........Installing support dependencies.........."
sudo apt-get -y install mc vim htop curl
echo "..........Done...................."

# Install Additional Dependencies
echo "..........Installing dev dependencies.........."
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs libgdbm-dev libffi-dev libgmp-dev
echo "..........Done...................."

echo "..........Installing ImageMagick dependencies.........."
sudo apt-get -y install ruby-rmagick imagemagick libmagickwand-dev
echo "..........Done...................."

# Install PhantomJs for exporting chart into images
echo ".....install Phantom Js.............."
sudo apt-get -y install phantomjs
echo ".........Done"

# Install MySQL
echo "..........Install MySQL/sqlite3................"
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:ondrej/mysql-5.7
sudo apt-get update
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev

# Install RVM (Ruby Version Manager)
echo ".....Installing RVM.............."
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable
echo "......Loading RVM.........."
source ~/.rvm/scripts/rvm
rvm requirements
echo "...........Done..........."

echo "..........Installing Nginx................"
sudo apt-get -y install nginx
sudo ln -s /etc/nginx /opt/nginx

echo "..........Install Monit/Munin................"
sudo apt-get -y install monit munin
sudo ln -s /etc/monit /opt/monit
sudo ln -s /etc/munin /opt/munin

############################ CONFIGURATIONS ########################

DB_NAME="*****"
DB_USER="*****"
DB_PASS="*****"

echo "..........Configure MySQL................"
mysql -uroot -p[PASSWORD]-e "create database $DB_NAME character set utf8 collate utf8_unicode_ci; grant all privileges on $DB_NAME.* to $DB_USER@localhost identified by '$DB_PASS' with grant option;"
echo ".........Done"

# Configure RVM
echo ".....Configure RVM.............."
echo 'rvm_trust_rvmrcs_flag=1' > ~/.rvmrc


# Install Latest version of Ruby
echo "........Installing Ruby v $RUBY_VERSION ..."
RUBY_VERSION="ruby-2.3.1"
rvm install $RUBY_VERSION
rvm --default use $RUBY_VERSION
echo "==> Done........."

# Configure Gem
echo ".....Configure rubyGem.............."
echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
printf '.ruby-gemset\n.ruby-version\n' > ~/.gitignore_global

# Install Latest version of Rails
echo "..........Installing Rails gem................"
RAILS_VERSION="5.4.1"
gem install rails -v=$RAILS_VERSION
gem install bundler

echo ".........Done"

# # Install AtlantProtocol
# echo "..........Install AtlantProtocol................"
# mkdir ~/application && cd ~/application
# mkdir ./app_config
# mkdir ./shared && mkdir ./shared/system && mkdir ./shared/pids && mkdir ./shared/log, ./shared/assets
# mkdir ./releases && cd ./releases
# # echo " -- export source"
# # svn export https://mysvn.ru/tetra_svn/AtlantPtorocol/tags/$AP_BRANCH/ --username $AP_TAG_SVN_USERNAME --password $AP_TAG_SVN_PASSWORD --no-auth-cache

# RAILS_ROOT="$HOME/application/current"
# echo " -- prepare application folders"
# ln -s ~/application/releases/$AP_BRANCH $RAILS_ROOT
# cd $RAILS_ROOT
# rm -R ./public/assets
# rm -R ./public/system
# rm -R ./public/log
# rm -R ./public/tmp/pids
# cd $RAILS_ROOT
# ln -s ~/application/shared/assets ./public/assets
# ln -s ~/application/shared/system ./public/system
# ln -s ~/application/shared/pids ./public/tmp/pids
# ln -s ~/application/shared/log ./log

# echo " -- prepare .rvmrc for application"
# rm -R $RAILS_ROOT/.rvmrc
# rvm --ruby-version use $RUBY_VERSION$RUBY_GEMSET --create

# echo " -- bundle application gems"
# cd $RAILS_ROOT
# bundle install --path ~/application/shared/bundle --without test --without development

# echo " -- prepare defaul application configs"
# cd $RAILS_ROOT/config
# mv $CFG_DIR/rails/config/gmaps_api_key.yml ./gmaps_api_key.yml
# mv $CFG_DIR/rails/config/app_config.yml ./app_config.yml
# mv $CFG_DIR/rails/config/database.yml ./database.yml
# mv $CFG_DIR/rails/config/backup.conf.rb ./backup.conf.rb
# mv $CFG_DIR/rails/config/loops.yml ./loops.yml

# echo " -- Migrate AtlantProtocol database"
# cd $RAILS_ROOT
# RAILS_ENV=production rake db:migrate

# echo " -- Create default AtlantProtocol user"
# RAILS_ENV=production rake db:migrate
# RAILS_ENV=production rake creator:user_create
# echo ".........Done"

# echo "..........configure unicorn for atlant-protocol................"
# sudo rm $RAILS_ROOT/config/unicorn.rb
# mv $CFG_DIR/rails/config/unicorn.rb ./unicorn.rb
# echo ".........Done"

# echo ".......... Start Unicorn and Background workers & add to startups"
# sudo mv $CFG_DIR/init.d/loops /etc/init.d/loops
# sudo mv $CFG_DIR/init.d/ap_unicorn /etc/init.d/ap_unicorn
# #sudo mv $CFG_DIR/init.d/mounter /etc/init.d/mounter

# sudo /etc/init.d/loops start
# sudo /etc/init.d/ap_unicorn start

# cd /etc/init.d
# sudo chmod +x /etc/init.d/loops
# sudo /usr/sbin/update-rc.d -f loops defaults
# sudo chmod +x /etc/init.d/ap_unicorn
# sudo /usr/sbin/update-rc.d -f ap_unicorn defaults
# #sudo chmod +x /etc/init.d/mounter
# #sudo /usr/sbin/update-rc.d -f mounter defaults
# # if you need to remove script
# #sudo /usr/sbin/update-rc.d -f mounter remove
# echo ".........Done"

# # Install WebServer
# echo "..........Configure nginx for atlant-protocol................"
# sudo rm /opt/nginx/nginx.conf
# sudo mv $CFG_DIR/nginx/nginx.conf /opt/nginx/nginx.conf
# sudo /etc/init.d/nginx restart
# echo ".........Done"

# echo "..........Configure Monit................"
# sudo mv $CFG_DIR/monit/monitrc /etc/monit/monitrc
# sudo mv $CFG_DIR/monit/conf.d/ap.cfg /etc/monit/conf.d/ap.cfg
# sudo mv $CFG_DIR/monit/conf.d/database.cfg /etc/monit/conf.d/database.cfg
# sudo mv $CFG_DIR/monit/conf.d/sys.cfg /etc/monit/conf.d/sys.cfg
# sudo mv $CFG_DIR/monit/conf.d/www.cfg /etc/monit/conf.d/www.cfg
# sudo /etc/init.d/monit start

echo "######################################"
echo "###### Installation Completed ########"
echo "######################################"

echo " ++ Please configure gmaps_api_key.yml, app_config.yml, backup.conf.rb, loops.yml, unicorn.example files ++"

echo "if something went wrong then checkout the log file $LOG_FILE"

