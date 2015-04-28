# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
BERKSHELF = false

# We'll mount the Chef::Config[:file_cache_path] so it persists between
# Vagrant VMs
host_cache_path = File.expand_path("../.cache", __FILE__)
guest_cache_path = "/tmp/vagrant-cache"

# ensure the cache path exists
FileUtils.mkdir(host_cache_path) unless File.exist?(host_cache_path)

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty64"

  # Install RVM, Ruby and Chef on the Virtual Machine.
  config.vm.provision :shell, :path => "scripts/install_rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "scripts/install_ruby.sh", :args => "1.9.3"
  unless BERKSHELF
    config.vm.provision :shell, :path => "scripts/geoshape-install.sh", :args => "vagrant release-1.3"
  end
  config.vm.provision :shell, :inline => "gem install chef --version 11.10.4 --no-rdoc --no-ri --conservative"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/trusty64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP. If you want to run multiple vms at once, you can change the .100 
  # running a private network eliminates the chances of conflicting with the network you are connected to. 
  # this is particularly useful when you want to run the vm on your laptop and endup being on various networks
  # or even no network connectivity 
  config.vm.network :private_network, ip: "192.168.99.200"

  # Create a public network, obtain it's ip through dhcp and bridge it through host's en0
  # config.vm.network :public_network, :bridge => 'en0: Ethernet'

  # The following can be used to specify a static ip through the host's  en0. You can use other nework adaptors such as 'en1: Wi-Fi (AirPort)'  
  # config.vm.network :public_network, :bridge => 'en0: Ethernet', ip: "192.168.10.222", netmask: "255.255.255.255"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #

  if BERKSHELF
    config.berkshelf.enabled = true
    config.vm.provision :chef_solo do |chef|
      chef.provisioning_path = "/opt/vagrant-chef"
      chef.cookbooks_path = "cookbooks"
      #chef.roles_path = "roles"
      #chef.data_bags_path = "data_bags"
      chef.add_recipe "apt"
      chef.add_recipe "python"
      chef.add_recipe "git"
      chef.add_recipe "rogue::postgresql"
      chef.add_recipe "rogue"

    #chef.add_role "web"
  
    # You may also specify custom JSON attributes:
      chef.json={'vagrant'=>true}
     
    ## pull the sprint release branch of geogit and use maploom instead of salamati    
#    chef.json={
#      'vagrant' => true,
#      'rogue' => {
#        'geogit' => {'branch' => 'SprintRelease'},
#        'rogue_geonode' => {'branch' => 'maploom'}
#       },
#      'tomcat'=>{'java_options' => "-Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"}
#    }     

    end
  end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = ""
  #   chef.validation_key_path = ".chef/chef-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "chef-validator"
end
