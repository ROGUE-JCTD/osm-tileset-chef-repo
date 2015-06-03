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

["python-software-properties"].each do |p|
  package p
end

["postgresql", "postgresql-contrib", "postgis", "postgresql-contrib",  "postgresql-9.3-postgis-2.1", "libpq-dev", "php5", "libsqlite3-dev"].each do |p|
  package p
end

["libmapnik2.2", "mapnik-utils"].each do |p|
  package p
end

["osm2pgsql"].each do |p|
  package p
end

["apache2", "apache2-mpm-worker"].each do |p|
  package p
end

["munin-node", "munin", "munin-plugins-extra", "libdbd-pg-perl", "sysstat", "iotop", "ptop"].each do |p|
  package p
end
