#
# Cookbook Name:: apt
# Recipe:: mapnik
#
# Copyright 2015, JAM
#

package "apt"

["libmapnik2.2", "mapnik-utils"].each do |p|
  package p
end
