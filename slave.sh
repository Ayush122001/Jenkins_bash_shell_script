#!/bin/bash
sudo apt-get update
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install -y openjdk-11-jdk 
sudo java --version
sudo mkdir /j
sudo useradd jenkins
sudo echo "jenkins:jenkins" | sudo chpasswd
sudo mkdir /home/jenkins
sudo chown jenkins /home/jenkins/
sudo chown -R jenkins:jenkins jenkins /j
sudo touch test
sudo chown ubuntu test
sudo sed 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config > test
sudo cp test /etc/ssh/sshd_config
sudo systemctl restart sshd
