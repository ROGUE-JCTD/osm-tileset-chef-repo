name "rogue"
description "Master role applied to rogue tile server"

override_attributes(
  :country => "us"
)

default_attributes(
  :postgresql => {
    :versions => ["9.1"],
    :settings => {
      :defaults => {
        :shared_buffers => "3GB",
        :maintenance_work_mem => "7144MB",
        :effective_cache_size => "8GB"
      }
    }
  },
  :sysctl => {
    :postgres => {
      :comment => "Increase shared memory for postgres",
      :parameters => {
        "kernel.shmmax" => 4 * 1024 * 1024 * 1024,
        "kernel.shmall" => 4 * 1024 * 1024 * 1024 / 4096
      }
    },
    :cpu_tune => {
      :comment => "Tune kern sched migration cost",
      :parameters => {
        "kernel.sched_autogroup_enabled" => 0,
        "kernel.sched_migration_cost_ns" => 25000000
      }
    }
  },
  :tile => {
    :node_file => "/store/database/nodes",
    :styles => {
      :default => {
        :tile_directories => [
          { :name => "/store/tiles/default-low", :min_zoom => 0, :max_zoom => 16 },
          { :name => "/store/tiles/default-high", :min_zoom => 17, :max_zoom => 19 }
        ]
      }
    }
  }
)

run_list(
  "role[apt]"
#  "role[tile]"
