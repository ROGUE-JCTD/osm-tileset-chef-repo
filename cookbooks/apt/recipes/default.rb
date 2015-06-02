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

execute "apt-pack1" do
  action :run
  command "/usr/bin/apt-get install -y git"
end

execute "apt-pack2" do
  action :run
  command "/usr/bin/apt-get install -y aptitude autoconf automake libtool make g++ libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libxml2-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev libproj-dev protobuf-c-compiler libprotobuf-c0-dev lua5.2 liblua5.2-dev"
end

execute "apache" do
  action :run
command "/usr/bin/apt-get install -y apache2"
end

execute "postgres" do
  action :run
command "/usr/bin/apt-get install -y postgresql"
end

python-software-properties

["python-software-properties"].each do |p|
  package p
end
