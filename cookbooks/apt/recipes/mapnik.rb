#
# Cookbook Name::apt
# Recipe:: mapnik
#
# Copyright 2015, JAM
# For some reason the mapnik in 12.04 is named mapnik2.
# Only configuration is a symbolic link between mapnik and mapnik 2 
# to resolve the confusions. 

["libmapnik2.2", "mapnik-utils"].each do |p|
  package p
end
