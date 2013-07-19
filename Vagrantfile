# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant::Config.run do |config|
  config.vm.box = "railsbox"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.vm.box_url = "~/Downloads/install/vagrant/precise64.box"
  
  config.vm.forward_port 4040, 4040
  config.vm.forward_port 3306, 3306
  
  config.vm.share_folder "app", "/home/vagrant/app", "app/", :create => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "vim"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::user"
    chef.add_recipe "git"
    chef.add_recipe "postgresql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "nodejs::install_from_source"
    chef.add_recipe "imagemagick::rmagick"

    chef.json.merge!({
      :vim => {
        "extra_packages" => "vim.rails"
      },
      :rvm => {
        "rubies" => [
          "ruby-2.0.0-p0",
          "ruby-1.9.3"
        ],
        "default_ruby" => 'ruby-1.9.3',
        "user_installs" => ["vagrant"]
      },
      :mysql => {
        "server_root_password" => "root",
        "server_repl_password" => "root",
        "server_debian_password" => "root",
        "allow_remote_root" => true,
        "client" => {
          "packages" => ["mysql-client", "libmysqlclient-dev","ruby-mysql"]
        }
      }
    })

  end
end
