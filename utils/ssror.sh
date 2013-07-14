#! /bin/sh
sudo sh <<SCRIPT
	echo 'Upgrading system'
	echo '================'
	apt-get -y upgrade
	apt-get -y install curl git-core ia32-libs ia32-libs-multiarch nodejs nodejs-dev chromium-browser

	echo 'Installing RVM'
	echo '=============='
	curl -L https://get.rvm.io | bash -s stable
	echo '[[ -s "~/.rvm/scripts/rvm" ]] && source "~/ror-student/.rvm/scripts/rvm"' >> ~/.bashrc

	echo 'Installing Ruby 1.9.3'
	echo '====================='
	rvm install 1.9.3

	echo 'Installing Rails'
	echo '================'
	gem install rails -v 3.2.13

	echo 'Installing Redcar'
	echo '================='
	gem install redcar

	echo 'Installing Heroku'
	echo '================='
	# add heroku repository to apt
	echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list

	# install heroku's release key for package verification
	wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -

	# update your sources
	apt-get update

	# install the toolbelt
	apt-get install -y heroku-toolbelt
SCRIPT

