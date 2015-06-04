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
rvm install ruby-2.0.0-p353
rvm --default use 2.0.0-p353
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
fi

#echo "Bundle install......"
gem install bundler
bundle install
#echo "Bundle complete....."
#
#echo "Berks install......"
gem install berkshelf -v 3.2.3
berks install
echo "Berks complete..."

cd ..
curl -L https://www.chef.io/chef/install.sh | sudo bash
chmod -R 755 *

# Setup Chef Run folder
# if dna.json is in /opt/chef-run, move it out, then run the following, then put it back
# Also remove the other dna files that ware aren't using for this setup.

#if [ -f chef-run/dna.json ];
#then
#echo "Copying existing dna.json"
#cp chef-run/dna.json ./dna-copy.json
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#cp dna-copy.json chef-run/dna.json
#rm dna-copy.json
#rm chef-run/dna_database.json
#rm chef-run/dna_application.json
#cd chef-run
#else
#echo "Using default dna.json"
#mkdir chef-run
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#rm chef-run/dna_application.json
#rm chef-run/dna_database.json
#cd chef-run
## Edit dna.json to use correct FQDN… Note: update the url to your server’s url’. If there is no fully qualified domain name, you can simply remove the line from the dna file
#sed -i 's/fqdn/fqdn-ignore/g' dna.json
## if vagrant is specified, add "vagrant":true
#if [ "$1"  = "vagrant" ];
#then
#echo "Vagrant specified..."
#sed -i '2 i\
#\  "vagrant": true,
#' dna.json
#fi
#fi

# Change username referenced in provision.sh to correct user if the user on the box is not ‘rogue’ Note: manually view provision.sh and change the user to rogue
