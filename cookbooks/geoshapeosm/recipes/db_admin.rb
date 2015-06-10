#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, OpenStreetMap Foundation
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

package "postgresql"
package "postgresql-common"
package "postgresql-server"

service "postgresql" do
  action [:enable, :start]
  supports :status => true, :restart => true, :reload => true
end

node[:postgresql][:versions].each do |version|
  package "postgresql-#{version}"
  package "postgresql-client-#{version}"
  package "postgresql-contrib-#{version}"
  package "postgresql-server-dev-#{version}"

  defaults = node[:postgresql][:settings][:defaults] || {}
  settings = node[:postgresql][:settings][version] || {}

  template "/etc/postgresql/#{version}/main/postgresql.conf" do
    source "postgresql.conf.erb"
    owner "postgres"
    group "postgres"
    mode 0644
    variables :version => version, :defaults => defaults, :settings => settings
    notifies :reload, "service[postgresql]"
  end

  template "/etc/postgresql/#{version}/main/pg_hba.conf" do
    source "pg_hba.conf.erb"
    owner "postgres"
    group "postgres"
    mode 0640
    variables :early_rules => settings[:early_authentication_rules] || defaults[:early_authentication_rules],
              :late_rules => settings[:late_authentication_rules] || defaults[:late_authentication_rules]
    notifies :reload, "service[postgresql]"
  end

  template "/etc/postgresql/#{version}/main/pg_ident.conf" do
    source "pg_ident.conf.erb"
    owner "postgres"
    group "postgres"
    mode 0640
    variables :maps => settings[:user_name_maps] || defaults[:user_name_maps]
    notifies :reload, "service[postgresql]"
  end
end
