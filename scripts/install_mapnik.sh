#!/bin/bash
# exit if anything returns failure
set -e

apt-get update

# install required mapnik packages
apt-get install -y add-apt-repository python-software-properties libmapnik libmapnik-dev mapnik-utils python-mapnik
apt-get install -y subversion git-core tar unzip wget bzip2 build-essential aptitude autoconf automake libtool make g++ libboost-all-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libxml2-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev proj libproj-dev protobuf-c-compiler libprotobuf-c0-dev lua5.2 liblua5.2-dev libboost-all-dev munin-node munin libfreetype6-dev libpng12-dev libtiff4-dev libicu-dev libgdal-dev libcairo-dev libcairomm-1.0-dev apache2 apache2-dev libagg-dev liblua5.2-dev ttf-unifont lua5.1 liblua5.1-dev node-carto

# Pull mapnik-repo if it doesn't already exist on the VM.

cd /opt
if [ -d mapnik ];
then
  chown -R vagrant:vagrant mapnik
  cd mapnik
else
  git clone git://github.com/mapnik/mapnik.git
  cd /opt/mapnik/src
  git pull && git checkout 2.2.x
fi

cd /opt
chown -R vagrant:vagrant mapnik

cd /opt/mapnik
#./configure PREFIX="/opt/mapnik" PYTHON_PREFIX="/opt/mapnik" OPTIMIZATION=3 INPUT_PLUGINS=all
python scons/scons.py configure PREFIX="/opt/mapnik" PYTHON_PREFIX="/opt/mapnik" OPTIMIZATION=3 INPUT_PLUGINS=all
make
make install
ldconfig
