#!/bin/bash
# exit if anything returns failure
set -e

# Finish mapnik configuration.

osm2pgsql --create --slim -C 1500 --number-processes 1 -S /home/osmdata/src/openstreetmap-carto/openstreetmap-carto.style --hstore --multi-geometry /opt/osm-tileset-chef-repo/sample/guatemala-latest.osm.pbf
