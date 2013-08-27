# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant::Config.run do |config|
  config.vm.box = "railsbox"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.vm.box_url = "~/Downloads/install/vagrant/precise64.box"
  
  #web applications
  config.vm.forward_port 4040, 4040
  config.vm.forward_port 4041, 4041
  config.vm.forward_port 4042, 4042
  config.vm.forward_port 3050, 3050
  #mysql
  config.vm.forward_port 3306, 3306
  #postgresql
  config.vm.forward_port 5432, 5432
  
  config.vm.share_folder "app", "/home/vagrant/app", "app/", :create => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "vim"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "git"
    chef.add_recipe "git-flow"
    chef.add_recipe "postgresql::server"
#    chef.add_recipe "postgresql::apt_pgdg_postgresql"
    chef.add_recipe "mysql::server"
    chef.add_recipe "nodejs::install_from_source"
    chef.add_recipe "imagemagick::rmagick"

    chef.json.merge!({
      :vim => {
        "extra_packages" => "vim.rails"
      },
      :rbenv => {
        'user_installs' => [
          { 
            'user'    => 'vagrant',
            'rubies'  => ['1.9.3-p0', '1.9.3-p286'],
            'global'  => '1.9.3-p0',
            'gems'    => {
              '1.9.3-p0' => [
                { 'name'    => 'bundler' },
                { 'name'    => 'rake' }
              ],
              '1.9.3-p286' => [
                { 'name'    => 'bundler' },
                { 'name'    => 'rake' }
              ]
             }
          }
        ]
      },
      :mysql => {
        "server_root_password" => "root",
        "server_repl_password" => "root",
        "server_debian_password" => "root",
        "allow_remote_root" => true,
        "client" => {
          "packages" => ["mysql-client", "libmysqlclient-dev","ruby-mysql"]
        }
      },
      :postgresql => {
        :version => '9.1',
        :password => {
          :postgres => "secret"
        },
        :run_list => ["recipe[postgresql::server]"],
      }
      
    })

  end
end
