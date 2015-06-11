execute 'mkdir /home/osmdata/src' do
   user 'osmdata'
end
execute 'git clone https://github.com/gravitystorm/openstreetmap-carto.git' do
   cwd '/home/osmdata/src'
   user 'osmdata'
end
execute 'git pull && git checkout' do
   cwd '/home/osmdata/src/openstreetmap-carto'
   user 'osmdata'
end
execute 'git clone https://github.com/mapbox/carto.git' do
   cwd '/home/osmdata/src'
   user 'osmdata'
end
execute 'git pull && git checkout' do
   cwd '/home/osmdata/src/carto'
   user 'osmdata'
end
execute 'add-apt-repository -y ppa:chris-lea/node.js' do
   cwd '/home/osmdata/src'
   user 'root'
end
execute 'apt-get-update' do
   user 'root'
end
execute 'apt-get install nodejs' do
   cwd '/home/osmdata/src'
   user 'root'
end
execute 'npm install npm' do
   cwd '/home/osmdata/src'
   user 'osmdata'
end
execute 'npm install millstone carto' do
   user 'osmdata'
end
