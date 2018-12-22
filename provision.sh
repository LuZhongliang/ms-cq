#!/bin/bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sh -c 'cat /vagrant/mirror-aliyun > /etc/apt/sources.list'
curl -fsSL https://get.docker.com | sudo bash -s docker --mirror Aliyun
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt install -y htop openjdk-8-jdk docker-compose
sudo usermod -aG docker vagrant
# sudo docker run -d --name mysql --restart always -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes -v /vagrant/init_db.sql:/docker-entrypoint-initdb.d/init_db.sql:ro registry.docker-cn.com/library/mysql
sudo wget -O /var/opt/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war
sudo java -jar /var/opt/jenkins.war &