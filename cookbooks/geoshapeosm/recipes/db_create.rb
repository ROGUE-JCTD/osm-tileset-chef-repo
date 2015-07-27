execute "create role" do
   user "postgres"
   command "psql -c \"create role #{node['db_admin_name']} with createdb inherit login;\""
   not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname = '#{node['db_admin_name']}';\" | wc -l`.chomp == "1" }
end

execute "create osm database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']} owner #{node['db_admin_name']};\""
   not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node['db_name']}';\" | wc -l`.chomp == "1" }
end

execute "create adminpack extension" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension adminpack;\""
   not_if { `sudo -u postgres psql -d '#{node['db_name']}' -tAc \"SELECT * FROM pg_extension where extname = 'adminpack';\" | wc -l`.chomp == "1" }
end

execute "create hstore extension" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension hstore;\""
   not_if { `sudo -u postgres psql -d '#{node['db_name']}' -tAc \"SELECT * FROM pg_extension where extname = 'hstore';\" | wc -l`.chomp == "1" }
end

execute "munin-node-configure --sh | sudo sh" do
   user "root"
end

execute "service munin-node restart" do
   user "root"
end
