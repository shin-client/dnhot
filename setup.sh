#!/bin/bash

# Cập nhật và nâng cấp hệ thống
apt install sudo -y
sudo apt update -y
sudo apt upgrade -y

# Cài Go và Git
sudo apt install golang -y
sudo apt install git -y

# Clone repository hulk
git clone https://github.com/grafov/hulk.git

# cấp quyền và chạy run.sh
chmod +x run-hulk.sh
./run-hulk.sh
