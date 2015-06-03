name "countries"
description "Main Geoshape Mapnik PostGIS install package"

default_attributes(
  :countries  => {
    :name => {
#     :north_america => {:url => http://download.geofabrik.de/north-america-latest.osm.bz2 }'
#     :central_america => {:url => http://download.geofabrik.de/central-america-latest.osm.bz2 },
     :guatemala => {:url => "http://download.geofabrik.de/central-america/guatemala-latest.osm.bz2"},
     :haiti_dominican_repub => {:url => "http://download.geofabrik.de/central-america/haiti-and-domrep.html"}
     }
   }
)

run_list(
 "recipe[countries]"
)
