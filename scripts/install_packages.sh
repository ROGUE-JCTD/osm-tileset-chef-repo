#!/bin/bash
# exit if anything returns failure
set -e

# Update the package list
apt-get update

# install Postgresql packages.  These include packages necessary for mapnik.

#apt-get install -y postgresql-client-9.3 
apt-get install -y libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libboost-thread-dev
apt-get install -y libicu-dev python-dev libxml2 libxml2-dev libfreetype6 libfreetype6-dev libjpeg-dev libpng-dev libproj-dev libtiff-dev libcairo2 libcairo2-dev python-cairo python-cairo-dev libcairomm-1.0-1 libcairomm-1.0-dev ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra git build-essential python-nose libgdal1-dev python-gdal postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3 postgresql-9.3-postgis-2.1 libpq-dev php5 libsqlite3-dev

# install mapnik packages
apt-get install -y add-apt-repository python-software-properties libmapnik libmapnik-dev mapnik-utils python-mapnik
apt-get install -y subversion git-core tar unzip wget bzip2 build-essential aptitude autoconf automake libtool make g++ libboost-all-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libxml2-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev proj libproj-dev protobuf-c-compiler libprotobuf-c0-dev lua5.2 liblua5.2-dev libboost-all-dev munin-node munin libfreetype6-dev libpng12-dev libtiff4-dev libicu-dev libgdal-dev libcairo-dev libcairomm-1.0-dev libagg-dev liblua5.2-dev ttf-unifont lua5.1 liblua5.1-dev node-carto

# Install apache packages
apt-get install -y apache2 apache2-dev apache2-mpm-worker

# Install other packages
apt-get install -y curl
apt-get install -y git
