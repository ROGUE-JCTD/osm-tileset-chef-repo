# install Postgresql packages.  These include packages necessary for postgis and mapnik.

execute "apt-get update" do
  user "root"
end

["libc6", "libgdal1h", libgeos-c1", "libproj0", "libxml2"].each do |p|
  package p
end

["postgresql-9.4", "postgresql-9.4-postgis-scripts", "postgis", "postgresql-contrib-9.4", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end
