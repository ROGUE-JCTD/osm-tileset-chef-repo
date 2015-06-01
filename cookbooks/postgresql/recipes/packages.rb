# install Postgresql packages.  These include packages necessary for postgis and mapnik.

["postgresql-9.1", "postgresql-server-dev-9.1", "postgresql-contrib-9.1", "postgis postgresql-9.1-postgis", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end
