#!/bin/bash
# ---------------------------------------------
# AIML Slave Setup Script
# ---------------------------------------------
set -e
set -o pipefail
 
echo "🔄 Updating system..."
sudo apt update -y && sudo apt upgrade -y
 
echo "🐬 Installing MySQL client..."
sudo apt install -y mysql-client libmysqlclient-dev
 
echo "🛠️ Installing build tools..."
sudo apt install -y gcc make libssl-dev libbz2-dev libffi-dev zlib1g-dev
 
echo "🔥 Installing Redis..."
sudo apt install -y redis-server
sudo systemctl enable redis-server
sudo systemctl start redis-server
 
echo "🎬 Installing FFmpeg..."
sudo apt install -y ffmpeg
echo "🐍 Installing Python 3.11.9..."
cd /opt/
sudo wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
sudo tar xzf Python-3.11.9.tgz
cd Python-3.11.9
sudo ./configure --enable-optimizations
sudo make altinstall
python3.11 --version
 
echo "📦 Upgrading pip..."
python3.11 -m ensurepip --upgrade
python3.11 -m pip install --upgrade pip setuptools wheel
 
echo "🌿 Installing Git..."
cd /home/ubuntu/
sudo apt install -y git
 
echo "✅ AIML setup completed!"