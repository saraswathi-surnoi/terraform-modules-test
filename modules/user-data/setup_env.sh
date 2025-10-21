#!/bin/bash
# ---------------------------------------------
# Backend Slave Setup Script
# ---------------------------------------------
set -e
set -o pipefail
 
echo "🔄 Updating system..."
sudo yum update -y
 
echo "🐬 Installing dependencies: Java, Git, Docker..."
sudo yum install -y java-17-amazon-corretto-devel git docker unzip wget curl
sudo systemctl enable docker
sudo systemctl start docker
echo "🎬 Installing Maven..."
wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
sudo tar xzvf apache-maven-3.9.8-bin.tar.gz -C /opt/
sudo ln -s /opt/apache-maven-3.9.8 /opt/maven
echo 'export M2_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=$PATH:$M2_HOME/bin' | sudo tee -a /etc/profile
 
echo "✅ Backend slave setup completed!"