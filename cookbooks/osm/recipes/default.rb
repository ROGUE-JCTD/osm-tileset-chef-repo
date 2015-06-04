execute 'mkdir /home/osmdata/src' do
   user 'osmdata'
end
#execute 'mkdir /home/osmdata/src/carto' do
#   user 'osmdata'
#end
execute 'git clone https://github.com/gravitystorm/openstreetmap-carto.git' do
   cwd '/home/osmdata/src'
   user 'osmdata'
end

