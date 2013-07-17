# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant::Config.run do |config|
  config.vm.box = "fandom"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.forward_port 4040, 4040
  config.vm.forward_port 3306, 3306
  
  config.vm.share_folder "app", "/home/vagrant/app", "app/", :create => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"
    chef.add_recipe "git"
    chef.add_recipe "postgresql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "imagemagick::rmagick"

    chef.json.merge!({
      :rvm => {
        :default_ruby => 'ruby-1.9.3'
      },
      :mysql => {
        "server_root_password" => "root",
        "server_repl_password" => "root",
        "server_debian_password" => "root",
        "allow_remote_root" => true
      }
    })

  end
end
