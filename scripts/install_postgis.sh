#!/bin/bash
# exit if anything returns failure
set -e

# install Postgresql packages.  These include packages necessary for mapnik.
#apt-get install -y postgresql-client-9.3 
apt-get install -y libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libboost-thread-dev
apt-get install -y libicu-dev python-dev libxml2 libxml2-dev libfreetype6 libfreetype6-dev libjpeg-dev libpng-dev libproj-dev libtiff-dev libcairo2 libcairo2-dev python-cairo python-cairo-dev libcairomm-1.0-1 libcairomm-1.0-dev ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra git build-essential python-nose libgdal1-dev python-gdal postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3 postgresql-9.3-postgis-2.1 libpq-dev php5 libsqlite3-dev
