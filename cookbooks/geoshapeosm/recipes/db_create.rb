package "postgresql"
package "postgresql-contrib"

execute "create role" do
   user "postgres"
   command "psql -c \"create role #{node['db_admin_name']} with createdb inherit login;\""
   not_if "psql -c \"SELECT rolname FROM pg_roles where rolname = '#{node['db_admin_name']}'\" | grep -c #{node['db_admin_name']}";
end

execute "create role" do
   user "postgres"
   command "psql -c \"create role #{node['db_render_name']} with inherit login;\""
   not_if "psql -c \"SELECT rolname FROM pg_roles where rolname = '#{node['db_render_name']};'\" | grep -c #{node['db_render_name']}";
end

execute "create osm database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']} owner #{node['db_admin_name']};\""
end

execute "create extension" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension adminpack; create extension hstore;\""
end

execute "grant connect" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"GRANT CONNECT ON DATABASE #{node['db_name']} to #{node['db_render_name']};\""
end

execute "grant select" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"GRANT SELECT ON ALL TABLES IN SCHEMA public to #{node['db_render_name']};\""
end

execute "munin-node-configure --sh | sudo sh" do
   user "root"
end

execute "service munin-node restart" do
   user "root"
end
