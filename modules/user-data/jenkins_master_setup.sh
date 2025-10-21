#!/bin/bash
# ---------------------------------------------
# Jenkins Master Setup Script (Amazon Linux 2)
# ---------------------------------------------
 
set -e
set -o pipefail
 
echo "🔄 Updating system..."
sudo yum update -y
 
echo "🐬 Installing dependencies: Java, Git, Docker..."
sudo yum install -y java-17-amazon-corretto-devel git docker unzip wget curl
sudo systemctl enable docker
sudo systemctl start docker

echo "Installing Maven..."
wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
sudo tar xzvf apache-maven-3.9.8-bin.tar.gz -C /opt/
sudo ln -s /opt/apache-maven-3.9.8 /opt/maven
echo 'export M2_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=$PATH:$M2_HOME/bin' | sudo tee -a /etc/profile
 
echo "Installing Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "Jenkins Master setup completed!"