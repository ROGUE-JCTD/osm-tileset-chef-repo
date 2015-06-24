#!/bin/bash
# exit if anything returns failure
set -e

# Finish mapnik configuration.

sed -i 's/XML=\/home\/jburgess\/osm\/svn\.openstreetmap\.org\/applications\/rendering\/mapnik\/osm\-local\.xml/XML=\/home\/osmdata\/src\/openstreetmap-carto\/mapnik.xml/' /usr/local/etc/renderd.conf
sed -i 's/HOST=tile\.openstreetmap\.org/HOST=localhost/' /usr/local/etc/renderd.conf
sed -i 's/plugins_dir=\/usr\/lib\/mapnik\/input/plugins_dir=\/usr\/lib\/mapnik\/2.2\/input\//' /usr/local/etc/renderd.conf
