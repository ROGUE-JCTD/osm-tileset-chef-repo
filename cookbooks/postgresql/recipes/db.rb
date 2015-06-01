package "postgresql"
package "postgresql-contrib"

execute "create new postgresql database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']};\""
end
