# install Postgresql packages.  These include packages necessary for postgis and mapnik.

execute "apt-add-repository -y ppa:ubuntugis/ppa" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

["postgresql-9.1", "postgresql-server-dev-9.1", "postgresql-contrib-9.1", "postgresql-9.1-postgis", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end
