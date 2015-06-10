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
#execute 'npm install' do
#   user 'osmdata'
#   cwd '/home/osmdata/src/carto'
#end
