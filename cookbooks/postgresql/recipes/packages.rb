# install Postgresql packages.  These include packages necessary for postgis and mapnik.

#execute "apt-add-repository -y ppa:ubuntugis/ppa" do
#  user "root"
#end

execute "apt-add-repository -y ppa:sharpie/for-science" do
  user "root"
end

execute "apt-add-repository -y ppa:sharpie/postgis-stable" do
  user "root"
end

execute "apt-add-repository -y ppa:ubuntugis/ubuntugis-unstable" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

["postgresql-9.1", "postgresql-server-dev-9.1", "postgresql-contrib-9.1", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end

["postgis", "postgresql-9.1-postgis2"].each do |p|
  package p
end
