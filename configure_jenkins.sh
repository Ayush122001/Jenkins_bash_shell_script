#!/bin/bash

sleep 30

wget localhost:8080/jnlpJars/jenkins-cli.jar

password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

sudo java -jar jenkins-cli.jar -auth admin:$password  -s http://localhost:8080/ install-plugin ssh-agent:1.23

sudo java -jar jenkins-cli.jar -auth admin:$password  -s http://localhost:8080/ install-plugin ssh-slaves:1.33.0

sudo systemctl restart jenkins

sleep 40

password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

sudo java -jar jenkins-cli.jar -auth admin:$password -s http://localhost:8080/ create-credentials-by-xml system::system::jenkins _  < cred.xml


sudo cat /var/lib/jenkins/config.xml | sed 's/-1/0/' > config.xml

sudo cp config.xml /var/lib/jenkins/config.xml

sudo systemctl restart jenkins

sleep 30
