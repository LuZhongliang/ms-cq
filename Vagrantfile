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
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    sudo sh -c 'cat /vagrant/mirror-aliyun > /etc/apt/sources.list' # 采用 阿里云 安装源
    # 添加 jenkins 安装源
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    # Add debian package sources
    sudo sh -c 'echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list'
    # sudo apt update -y
    # 添加 docker 安装源
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt install -y jenkins docker-compose
    sudo usermod -aG docker vagrant # 使用户 vagrant 可以直接运行 docker 
    sudo usermod -aG docker jenkins # 使用户 jenkins 可以直接运行 docker 
    sudo service jenkins restart # 使jenkins 用户使用 docker 权限生效
   SCRIPT

end
