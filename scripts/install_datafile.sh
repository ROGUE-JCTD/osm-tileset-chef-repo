#!/bin/bash
# exit if anything returns failure
set -e

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
