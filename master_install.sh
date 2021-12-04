#!/bin/bash
sudo apt-get update
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install -y openjdk-11-jdk 
sudo java --version
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sleep 5
sudo systemctl daemon-reload
sudo systemctl start jenkins
sleep 20
sudo systemctl enable jenkins
