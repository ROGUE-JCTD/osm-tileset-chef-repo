#!/bin/bash
# exit if anything returns failure
set -e

# install required mapnik packages
apt-get install -y aptitude autoconf automake libtool make g++ libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libxml2-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev libproj-dev protobuf-c-compiler libprotobuf-c0-dev lua5.2 liblua5.2-dev

# Pull mapnik-repo if it doesn't already exist on the VM.

cd /opt
if [ -d mapnik ];
then
  chown -R vagrant:vagrant mapnik
  cd mapnik
else
  git clone git://github.com/mapnik/mapnik.git
  cd /opt/mapnik/src
  git pull && git checkout 2.3.x
fi

cd /opt
chown -R vagrant:vagrant mapnik

cd /opt/mapnik
./configure PREFIX="$osmroot" PYTHON_PREFIX="$osmroot" OPTIMIZATION=3 INPUT_PLUGINS=all
make
make install
