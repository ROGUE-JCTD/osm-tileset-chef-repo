bash 'configure_openstreetmap_carto' do
   user 'osmdata'
   cwd '/home/osmdata'
   code <<-EOH
	sudo su - osmdata
	mkdir /home/osmdata/src
	cd /home/osmdata/src
	git clone https://github.com/gravitystorm/openstreetmap-carto.git
	cd /home/osmdata/src/openstreetmap-carto
	git pull && git checkout
	cd /home/osmdata/src
	git clone https://github.com/mapbox/carto.git
	cd /home/osmdata/src/carto
	git pull && git checkout
   EOH
end

execute './get-shapefiles.sh' do
   cwd '/home/osmdata/src/openstreetmap-carto'
   user 'osmdata'
end

execute 'chown -R osmdata:osmdata /home/osmdata/src' do
   user 'root'
end

