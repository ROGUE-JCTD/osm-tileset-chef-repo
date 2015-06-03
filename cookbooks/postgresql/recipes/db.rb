package "postgresql"
package "postgresql-contrib"

execute "create role" do
   user "postgres"
   command "psql -c \"create role #{node['db_admin_name']} with createdb inherit login;\""
end

execute "create role" do
   user "postgres"
   command "psql -c \"create role #{node['db_render_name']} with inherit login;\""
end

execute "create osm database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']} owner #{node['db_admin_name']};\""
end

execute "create extension" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension adminpack; create extension hstore;\""
end

execute "create extension" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"create extension hstore;\""
end


execute "grant connect" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"GRANT CONNECT ON DATABASE #{node['db_name']} to #{node['db_render_name']};\""
end

execute "grant select" do
   user "postgres"
   command "psql -d #{node['db_name']} -c \"GRANT SELECT ON ALL TABLES IN SCHEMA public to #{node['db_render_name']};\""
end
