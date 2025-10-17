#!/bin/bash

# Setup script for Network Principles Lab Environment
echo "Setting up Network Principles Lab Environment..."

# Update system
apt-get update

# Install required packages
apt-get install -y \
    curl \
    wget \
    git \
    net-tools \
    bridge-utils \
    tshark \
    python3 \
    python3-pip

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh --version 24.0.5
usermod -aG docker vscode

# Install Vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt-get update
apt-get install -y vagrant

# Install VirtualBox (for Vagrant)
apt-get install -y virtualbox

# Install Containerlab
bash -c "$(curl -sL https://get.containerlab.dev)"

# Install additional tools
pip3 install scapy

echo "Setup complete! You can now run the lab."
echo "Navigate to lab1/part1 and run: ./provided/capture_submission.sh"