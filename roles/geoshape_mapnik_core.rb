name "db_main"
description "Main Geoshape Mapnik PostGIS install package"

default_attributes(
  :postgresql => {
    :versions => ["9.1"],
    :settings => {
      :defaults => {
        :wal_level => "hot_standby",
        :archive_mode => "off",
        :archive_command => "/bin/cp %p /store/postgresql/archive/%f",
        :max_wal_senders => "2",
        :late_authentication_rules => [
          { :database => "replication", :user => "replication", :address => "146.179.159.168/32" },
          { :database => "replication", :user => "replication", :address => "146.179.159.170/32" }
        ]
      }
    }
  }
)

run_list(
 "recipe[geoshapeosm::apt-updates]",
 "recipe[geoshapeosm::groups]",
 "recipe[geoshapeosm::users]",
 "recipe[geoshapeosm::db_packages]",
 "recipe[geoshapeosm::db_create]",
 "recipe[geoshapeosm::postgis]",
 "recipe[geoshapeosm::osm_carto]",
 "recipe[geoshapeosm::osm_renderd]"
)
