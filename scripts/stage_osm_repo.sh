#!/bin/bash
# exit if anything returns failure
set -e

# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable

# install ruby, my machine has this and things work
source /usr/local/rvm/scripts/rvm
rvm get stable

rvm list known
rvm install ruby-2.0.0-p645
rvm --default use 2.0.0-p645
ruby -v # will show which version is being used

# Pull osm-rogue-repo if it doesn't already exist on the VM.

cd /opt
if [ -d osm-tileset-chef-repo ];
then
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
else
  git clone https://github.com/ROGUE-JCTD/osm-tileset-chef-repo
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
  echo $PWD
fi

gem install bundler
bundle install
berks install
echo "Berks complete..."

mkdir -p /opt/chef-run/cookbooks
berks vendor /opt/chef-run/cookbooks

cd ..
curl -L https://www.chef.io/chef/install.sh | sudo bash
chmod -R 755 *

# Change username referenced in provision.sh to correct user if the user on the box is not ‘rogue’ Note: manually view provision.sh and change the user to rogue
chef-solo -c /opt/osm-tileset-chef-repo/solo/solo.rb -j /opt/osm-tileset-chef-repo/solo/dna.json
