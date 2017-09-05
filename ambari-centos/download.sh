#!/usr/bin/env bash

reposerver="192.168.36.239"

# timezone config
echo 'modify lang and timezone'
sudo localectl set-locale LANG=en_US.utf8
sudo timedatectl set-timezone Asia/Shanghai

# copy vagrant ssh config
sudo mkdir -p /root/.ssh; 
sudo chmod 600 /root/.ssh; 
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# download and exec initenv.sh
curl -O http://${reposerver}/resource/initenv.sh
chmod +x initenv.sh
./initenv.sh

echo "Environment initialization completed, OK!"