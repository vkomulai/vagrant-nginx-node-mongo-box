# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64.box"

  config.vm.network "forwarded_port", guest: 4000, host: 7777
  config.vm.network "forwarded_port", guest: 27017, host: 17017

  # Install and configure nginx and node (only once)
  config.vm.provision :shell,
    path: "provisioning/install-nginx-node.sh"

  # Start node server everytime vagrant up is called
  config.vm.provision :shell,
    path: "provisioning/start-web.sh",
    run: "always",
    privileged: false

end
