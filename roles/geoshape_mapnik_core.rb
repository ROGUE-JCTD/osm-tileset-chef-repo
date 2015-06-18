name "geoshape_mapnik_core"
description "Main Geoshape Mapnik package install and configuration role script"

###############################################################################
#
# To Do someday
#
# Use Postgresql cookbook to manage the osm database.
#
# Need to see how it behaves with the installed database and postgis package.
#
# For now just run with the configuration settings in the cookbook.
#
###############################################################################

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
