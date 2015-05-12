#!/bin/bash
# exit if anything returns failure
set -e

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
