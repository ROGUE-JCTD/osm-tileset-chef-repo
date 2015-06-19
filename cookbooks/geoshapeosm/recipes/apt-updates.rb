#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2015, JAM
#

package "apt"

file "/etc/motd.tail" do
  action :delete
end

execute "apt-update" do
  action :run
command "/usr/bin/apt-get update"
end

["python-software-properties", "git", "unzip", "autoconf", "libtool"].each do |p|
  package p
end

["postgresql", "postgresql-contrib", "postgis", "postgresql-contrib",  "postgresql-9.3-postgis-2.1", "gdal-bin", "proj-bin", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end

["libmapnik2.2", "mapnik-utils", "python-mapnik", "libmapnik-dev"].each do |p|
  package p
end

["osm2pgsql", "libprotobuf-c0-dev", "protobuf-c-compiler", "lua5.2", "liblua5.2-dev"].each do |p|
  package p
end

["apache2", "apache2-mpm-worker"].each do |p|
  package p
end

["apache2-dev", "apache2-threaded-dev"].each do |p|
  package p
end

["munin-node", "munin", "munin-plugins-extra", "libdbd-pg-perl", "sysstat", "iotop", "ptop"].each do |p|
  package p
end

# Fontsheets required by osm stylesheets
["ttf-dejavu", "fonts-droid", "ttf-unifont"].each do |p|
  package p
end
