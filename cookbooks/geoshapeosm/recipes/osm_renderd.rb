bash 'install_mod_tile' do
   user 'osmdata'
   cwd '/home/osmdata/src'
   code <<-EOH
	cd /home/osmdata/src
	git clone git://github.com/openstreetmap/mod_tile.git
	cd /home/osmdata/src/mod_tile
	./autogen.sh
	cd /home/osmdata/src/mod_tile
	./configure
	cd /home/osmdata/src/mod_tile
	make
   EOH
end

execute 'make install' do
   cwd '/home/osmdata/src/mod_tile'
end

execute 'make install-mod_tile' do
   cwd '/home/osmdata/src/mod_tile'
end

execute 'ldconfig' do
   cwd '/home/osmdata/src/mod_tile'
end

bash 'config_renderd.conf' do
   code <<-EOH
	sed -i 's/XML=\/home\/jburgess\/osm\/svn\.openstreetmap\.org\/applications\/rendering\/mapnik\/osm\-local\.xml/XML=\/home\/osmdata\/src\/openstreetmap-carto\/mapnik.xml/' /usr/local/etc/renderd.conf
	sed -i 's/HOST=tile\.openstreetmap\.org/HOST=localhost/' /usr/local/etc/renderd.conf
	sed -i 's/plugins_dir=\/usr\/lib\/mapnik\/input/plugins_dir=\/usr\/lib\/mapnik\/2.2\/input\//' /usr/local/etc/renderd.conf
   EOH
end

execute 'cp mod_tile/debian/renderd.init /etc/init.d/renderd' do
   cwd '/home/osmdata/src'
end

execute 'chmod a+x /etc/init.d/renderd' do
end

bash 'config_renderd_daemon' do
   code <<-EOH
	sed -i 's/DAEMON=\/usr\/bin\/$NAME/DAEMON=\/usr\/local\/bin\/$NAME/' /etc/init.d/renderd
	sed -i 's/DAEMON_ARGS=""/DAEMON_ARGS=" -c \/usr\/local\/etc\/renderd.conf/“’ /etc/init.d/renderd
	sed -i 's/RUNASUSER=www-data/RUNASUSER=osmdata/ /etc/init.d/renderd
   EOH
end

execute 'carto project.mml > mapnik.xml' do
   cwd '/home/osmdata/src/openstreetmap-carto'
   user 'osmdata'
end

bash 'mkdir_mod_tile_dir' do
   code <<-EOH
	mkdir -p /var/lib/mod_tile
	chown osmdata:osmdata /var/lib/mod_tile
   EOH
end

service renderd start

Apache
 
execute 'echo "LoadModule tile_module /usr/lib/apache2/modules/mod_tile.so" > /etc/apache2/mods-available/tile.load' do
end

execute 'ln -s /etc/apache2/mods-available/tile.load /etc/apache2/mods-enabled/' do
end

execute 'cp -f /opt/osm-tileset-chef-repo/files /etc/apache2/sites-enabled/000-default.conf'
end

execute 'chmod u=rw,go=r /etc/apache2/sites-available/000-default.conf' do
end
