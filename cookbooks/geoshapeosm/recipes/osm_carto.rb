bash 'configure_carto_tree' do
   user 'osmdata'
   cwd '/home/osmdata'
   code <<-EOH
	sudo su - osmdata
#	cd /home/osmdata
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

execute 'add-apt-repository -y ppa:chris-lea/node.js' do
end

execute 'apt-get update' do
end

bash 'install_nodejs' do
   cwd '/home/osmdata/src'
   code <<-EOH
	apt-get install -y nodejs
   EOH
end

bash 'install_npm' do
   user 'root'
   cwd '/home/osmdata/src'
   code <<-EOH
	su - osmdata
	cd /home/osmdata/src
	npm install npm
   EOH
end

bash 'install_millstone' do
   user 'root'
   cwd '/home/osmdata/src'
   code <<-EOH
	su - osmdata
	cd /home/osmdata/src
	npm install millstone carto
   EOH
end

execute 'chown -R osmdata:osmdata /home/osmdata/src' do
   user 'root'
end

#execute 'mkdir /home/osmdata/src' do
#   user 'osmdata'
#end
#execute 'git clone https://github.com/gravitystorm/openstreetmap-carto.git' do
#   cwd '/home/osmdata/src'
#   user 'osmdata'
#end
#execute 'git pull && git checkout' do
#   cwd '/home/osmdata/src/openstreetmap-carto'
#   user 'osmdata'
#end
#execute 'git clone https://github.com/mapbox/carto.git' do
#   cwd '/home/osmdata/src'
#   user 'osmdata'
#end
#execute 'git pull && git checkout' do
#   cwd '/home/osmdata/src/carto'
#   user 'osmdata'
#end
#execute 'add-apt-repository -y ppa:chris-lea/node.js' do
#   cwd '/home/osmdata/src'
#end
#execute 'apt-get update' do
#end
#execute 'apt-get install -y nodejs' do
#   cwd '/home/osmdata/src'
#end
#execute 'cd /home/osmdata/src;npm install npm' do
#   user 'osmdata'
#end
#execute 'npm install millstone carto' do
#   user 'osmdata'
#end
