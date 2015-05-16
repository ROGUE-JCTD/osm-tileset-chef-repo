#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2015, JAM
#

#package "postgis"
include_recipe 'postgresql::server'
#package 'postgresql'
#package 'database::postgresql'
#include_recipe 'postgresql::server'
#include_recipe 'database::postgresql'

postgresql_database 'osm' do
  connection(
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end
