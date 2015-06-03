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

execute "create mapnik database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']} owner #{node['db_admin_name']};\""
end
