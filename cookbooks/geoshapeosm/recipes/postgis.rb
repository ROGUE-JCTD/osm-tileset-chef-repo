execute "create extension postgis" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension postgis;\""
end
execute "create extension postgis_topology" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension postgis_topology;\""
end
