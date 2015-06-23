#!/bin/bash
# exit if anything returns failure
set -e

# import guatamala osm data into PGIS.

osm2pgsql 

sed -i 's/XML=\/home\/jburgess\/osm\/svn\.openstreetmap\.org\/applications\/rendering\/mapnik\/osm\-local\.xml/XML=\/home\/osmdata\/src\/openstreetmap-carto\/mapnik.xml/' /usr/local/etc/renderd.conf
sed -i 's/HOST=tile\.openstreetmap\.org/HOST=localhost/' /usr/local/etc/renderd.conf
sed -i 's/plugins_dir=\/usr\/lib\/mapnik\/input/plugins_dir=\/usr\/lib\/mapnik\/2.2\/input\//' /usr/local/etc/renderd.conf
cp /home/osmdata/src/mod_tile/debian/renderd.init /etc/init.d/renderd
chmod a+x /etc/init.d/renderd
sed -i 's/DAEMON=\/usr\/bin\/$NAME/DAEMON=\/usr\/local\/bin\/$NAME/' /etc/init.d/renderd
sed -i 's/DAEMON_ARGS=""/DAEMON_ARGS=" -c \/usr\/local\/etc\/renderd.conf/“’ /etc/init.d/renderd
sed -i 's/RUNASUSER=www-data/RUNASUSER=osmdata/ /etc/init.d/renderd
su osmdata -f 'carto /home/osmdata/src/openstreetmap-carto/project.mml > /home/osmdata/src/openstreetmap-carto/mapnik.xml'
mkdir -p /var/lib/mod_tile
chown osmdata:osmdata /var/lib/mod_tile
echo "LoadModule tile_module /usr/lib/apache2/modules/mod_tile.so" > /etc/apache2/mods-available/tile.load
ln -s /etc/apache2/mods-available/tile.load /etc/apache2/mods-enabled/
cp -f /opt/osm-tileset-chef-repo/files/000-default.conf /etc/apache2/sites-enabled/000-default.conf
chmod u=rw,go=r /etc/apache2/sites-available/000-default.conf
service renderd stop
service renderd start
service apache2 restart
