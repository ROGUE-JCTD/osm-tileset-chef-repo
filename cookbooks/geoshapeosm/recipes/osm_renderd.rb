bash 'install_mod_tile' do
   user 'osmdata'
   cwd '/home/osmdata'
   code <<-EOH
	cd /home/osmdata/src
	git clone git://github.com/openstreetmap/mod_tile.git
	cd /home/osmdata/src/mod_tile
	autogen.sh
	cd /home/osmdata/src/mod_tile
	configure
	cd /home/osmdata/src/mod_tile
	make
   EOH
end
