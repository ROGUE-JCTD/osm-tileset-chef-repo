default_attributes(
  :accounts => {
    :users => {
      :osmemaster => { :status => :administrator },
      :osmemaster => { :status => :administrator }
   }
},
  :apache => {
    :mpm => "event",
    :timeout => 30,
    :event => {
      :server_limit => 32,
      :max_clients => 800,
      :threads_per_child => 50,
      :max_requests_per_child => 10000
    }
},
  :dev => {
    :rails => {
      :master => {
        :repository => "git://git.openstreetmap.org/rails.git",
        :revision => "master",
        :aliases => ["api06.dev.openstreetmap.org"]
      },
      :tomh => {
        :repository => "git://github.com/tomhughes/openstreetmap-website.git",
        :revision => "next"
      },
      :owl => {
        :repository => "git://github.com/ppawel/openstreetmap-website.git",
        :revision => "owl-activity-tab"
      },
      :groups => {
        :repository => "git://github.com/osmlab/openstreetmap-website.git",
        :revision => "groups-sketch"
      },
      :comments => {
        :repository => "git://github.com/ukasiu/openstreetmap-website.git",
        :revision => "comments_list"
      }
    }
  },
  :passenger => {
    :ruby_version => "2.1"
  },
  :postgresql => {
    :versions => ["9.1"],
    :settings => {
      :defaults => {
        :shared_buffers => "4GB",
        :work_mem => "32MB",
        :maintenance_work_mem => "64MB",
        :max_stack_depth => "4MB",
        :effective_cache_size => "4GB"
      },
      "9.1" => {
        :port => "5432"
      }
    }
  },
  :sysctl => {
    :postgres => {
      :comment => "Increase shared memory for postgres",
      :parameters => {
        "kernel.shmall" => "4194304",
        "kernel.shmmax" => "17179869184"
      }
    }
  }
)

#run_list(
#  "recipe[db::roles]",
#  "recipe[db::main]"
#)
