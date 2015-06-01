{
  "name": "db_main",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "description": "Main Mapnik DB install package",
  "run_list": [
    "recipe[postgresql::packages]"
    "recipe[postgresql::db]"
  ]
}
