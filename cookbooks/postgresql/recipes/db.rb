package "postgresql"
package "postgresql-contrib"

#{
#"user": {
#   "name": "postgres"
#   }
#}

execute "create new postgresql database" do
   user "postgres"
   command "psql -c \"create database #{node['osm']} owner #{node['db']['user']['name'];\""
end
