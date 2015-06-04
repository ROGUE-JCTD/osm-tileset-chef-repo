execute 'mkdir /home/osmdata/data' do
   user 'osmdata'
end
execute 'git clone https://github.com/gravitystorm/openstreetmap-carto.git' do
   cwd '/home/osmdata/data'
   user 'osmdata'
end
