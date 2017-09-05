#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts

# copy vagrant ssh config
sudo mkdir -p /root/.ssh; 
sudo chmod 600 /root/.ssh; 
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

setenforce 0
sudo sed -i 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

sudo mv /etc/yum.repos.d /etc/yum.repos.d.bak
sudo mkdir /etc/yum.repos.d
sudo cp /vagrant/repo/CentOS7-Base-aliyun.repo /etc/yum.repos.d/CentOS7-Base-aliyun.repo

sudo yum repolist
sudo yum install tree -y
sudo yum install wget -y
sudo yum install yum-utils -y
sudo yum install bash-completion -y
sudo yum install ntp -y

sudo localectl set-locale LANG=en_US.utf8
sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp yes

# Increasing swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024k
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

sudo service network restart
