#!/bin/bash

password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

name=$2

ip=$1

cat <<EOF | java -jar jenkins-cli.jar -auth admin:$password  -s http://localhost:8080/ create-node $name
<slave>
  <name>$name</name>
  <description></description>
  <remoteFS>/j</remoteFS>
  <numExecutors>3</numExecutors>
  <mode>NORMAL</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
  <launcher class="hudson.plugins.sshslaves.SSHLauncher" plugin="ssh-slaves@1.23">
    <host>$ip</host>
    <port>22</port>
    <credentialsId>slaveAuth</credentialsId>
    <maxNumRetries>10</maxNumRetries>
    <retryWaitTime>15</retryWaitTime>
    <sshHostKeyVerificationStrategy class="hudson.plugins.sshslaves.verifiers.NonVerifyingKeyVerificationStrategy"/>
  </launcher>
  <label>$name</label>
  <nodeProperties/>
</slave>
EOF
