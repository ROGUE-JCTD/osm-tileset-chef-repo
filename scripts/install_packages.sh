#!/bin/bash
# exit if anything returns failure
set -e

# Update the package list
apt-get update

# install Postgresql packages.  These include packages necessary for mapnik.

apt-get install -y postgresql-9.1 postgresql-server-dev-9.1 postgresql-contrib-9.1 postgis postgresql-9.1-postgis libpq-dev php5 libsqlite3-dev

# install mapnik packages

apt-get purge libmapnik* mapnik-* python-mapnik # If exists

apt-get install -y libxml2 libxml2-dev libfreetype6 libfreetype6-dev libjpeg-dev libpng-dev libproj-dev libtiff-dev libcairo2 libcairo2-dev python-dev python-cairo python-cairo-dev libcairomm-1.0-1 libcairomm-1.0-dev ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra git build-essential python-nose libgdal1-dev python-gdal 
apt-get install -y subversion git-core tar unzip wget bzip2 build-essential aptitude autoconf automake libtool make g++ libboost-all-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev protobuf-c-compiler libprotobuf-c0-dev lua5.2 liblua5.2-dev libboost-all-dev munin-node munin libpng12-dev libtiff4-dev libicu-dev libgdal-dev libcairo-dev libagg-dev liblua5.2-dev lua5.1 liblua5.1-dev 

# node-carto

#apt-get install -y libboost-filesystem1.48-dev libboost-program-options1.48-dev libboost-python1.48-dev libboost-regex1.48-dev libboost-system1.48-dev libboost-thread1.48-dev
apt-get install -y python-software-properties
add-apt-repository ppa:mapnik/boost
apt-get update
apt-get install -y libmapnik-dev mapnik-utils python-mapnik2
apt-get install -y libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libboost-thread-dev

# Install osm2pgsql
apt-get install -y osm2pgsql

# Install apache packages
apt-get install -y apache2 apache2-dev apache2-mpm-worker

# Install other required packages
apt-get install -y curl
apt-get install -y git
