#
# Cookbook Name:: users
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Create tile server user accounts

user 'osmdata' do
  supports :manage_home => true
  comment 'osm data'
  uid '1201'
  gid 'osmdata'
  shell '/bin/bash'
  home '/home/osmdata'
  password '$1$gkl9sSWg$U9aIhckrcXwr08PLbx7NG1'
  system false
  action :create
end
user 'osmrender' do
  supports :manage_home => true
  comment 'osm render'
  uid '1202'
  gid 'osmrender'
  shell '/bin/false'
  home '/home/osmrender'
  system false
  action :create
end
user 'tilecache' do
  supports :manage_home => true
  comment 'tile cache'
  uid '1203'
  gid 'sudo'
  shell '/bin/false'
  home '/home/tilecache'
  system false
  action :create
end
