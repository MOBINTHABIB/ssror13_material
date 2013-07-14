#! /bin/sh

# This script installs the packages required to use ruby on rails on Ubuntu
# It installs RVM, Ruby 1.9.3, Rails 3.2.13, Heroku and Redcar plus all the
# stuff that we will use during SSRoR 2013
#
# Use this script as reference if you want to do things by hand and to fix
# problems that may arise.

sudo sh <<SCRIPT
	echo 'Upgrading system'
	echo '================'
	# install heroku's release key for package verification
	wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
	# add heroku repository to apt
	echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
	# update your sources
	apt-get update
	apt-get -y upgrade
	apt-get -y install curl git-core ia32-libs ia32-libs-multiarch nodejs nodejs-dev heroku-toolbelt chromium-browser
SCRIPT

echo 'Installing RVM';
echo '==============';
curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3;
# if the command above doesn't work for you change it with
# bash -s stable --ruby=1.9.3 < <(curl -L https://get.rvm.io)
echo '[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"' >> ~/.bashrc;
source ~/.rvm/scripts/rvm;

#echo 'Installing Ruby 1.9.3';
#echo '=====================';
#rvm install 1.9.3;

echo 'Installing Rails';
echo '================';
gem install rails -v 3.2.13;

echo 'Installing Redcar';
echo '=================';
gem install redcar;
