#!/bin/bash
# exit if anything returns failure
set -e

while true; do
    read -p "=> you must be running as the osmdata user for this task to succeed. Also note all data in current database will be dropped and then data will be imported from the temp folder. continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "    Aborting script!";exit 1;;
        * ) echo "    Please answer yes or no.";;
    esac
done

count=`ls -1 /tmp/*.pbf 2>/dev/null | wc -l`
  if [ $count != 0 ]
  then
     for f in /tmp/*.pbf
     do
       osm2pgsql --create --slim -C 1500 --number-processes 1 -S /home/osmdata/src/openstreetmap-carto/openstreetmap-carto.style --hstore --multi-geometry $f
     done
  fi

count=`ls -1 /tmp/*.bz2 2>/dev/null | wc -l`
   if [ $count != 0 ]
   then
      for f in /tmp/*.bz2
      do
       osm2pgsql --create --slim -C 1500 --number-processes 1 -S /home/osmdata/src/openstreetmap-carto/openstreetmap-carto.style --hstore --multi-geometry $f
      done
   fi
   
service renderd stop
rm -rf /var/lib/mod_tile/default/*
service renderd start
