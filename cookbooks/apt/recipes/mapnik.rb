#
# Cookbook Name::apt
# Recipe:: mapnik
#
# Copyright 2015, JAM
#

execute "configure" do
  cwd '/opt/mapnik'
  action :run
  command "python scons/scons.py configure PREFIX=\"/opt/mapnik\" PYTHON_PREFIX=\"/opt/mapnik\" OPTIMIZATION=3 INPUT_PLUGINS=all"
end

execute "make" do
  cwd '/opt/mapnik'
  action :run
  command "make"
end

execute "make install" do
  cwd '/opt/mapnik'
  action :run
end

execute "ldconfig" do
  action :run
end
