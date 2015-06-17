execute "create extension postgis" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension postgis;\""
   not_if { `sudo -u postgres psql -d '#{node['db_name']}' -tAc \"SELECT * FROM pg_extension where extname = 'postgis';\" | wc -l`.chomp == "1" }
end
execute "create extension postgis_topology" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension postgis_topology;\""
   not_if { `sudo -u postgres psql -d '#{node['db_name']}' -tAc \"SELECT * FROM pg_extension where extname = 'postgis_topology';\" | wc -l`.chomp == "1" }
end
