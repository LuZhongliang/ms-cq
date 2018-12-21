# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.name = "microservice"
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.box_check_update = true

  #Private_network Settings
  config.vm.network "private_network", ip: "192.168.100.2"

  #SSH
  config.ssh.forward_agent = true

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  #Provision scripts
  config.vm.provision "shell",  inline: <<-SCRIPT
    # Add jenkins key
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    # Add debian package sources
    sudo sh -c 'echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list'
    sudo apt update -y
    # Add docker key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # Add docker repository
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt install -y openjdk-8-jdk jenkins docker-compose
    sudo usermod -aG docker vagrant
    
  SCRIPT

end
