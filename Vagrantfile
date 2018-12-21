# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.name = "microservice"
    v.memory = 3072
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
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    sudo sh -c 'cat /vagrant/mirror-aliyun > /etc/apt/sources.list'
    curl -fsSL https://get.docker.com | sudo bash -s docker --mirror Aliyun
    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt install -y htop openjdk-8-jdk
    sudo usermod -aG docker vagrant
    # sudo docker run -d --name mysql --restart always -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes -v /vagrant/init_db.sql:/docker-entrypoint-initdb.d/init_db.sql:ro registry.docker-cn.com/library/mysql
    sudo wget -O /var/opt/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war
    sudo java -jar /var/opt/jenkins.war &
  SCRIPT
   
end
