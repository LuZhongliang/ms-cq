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
    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt install -y openjdk-8-jdk
    curl -fsSL https://get.docker.com | sudo bash -s docker --mirror Aliyun
    sudo usermod -aG docker vagrant
    sudo docker run -d --name jenkins -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
  SCRIPT

end
