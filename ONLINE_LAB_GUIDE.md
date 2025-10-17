# Online Lab Guide - Run Your Network Principles Lab in the Cloud

## Option 1: GitHub Codespaces (Recommended) 🚀

### Step 1: Upload to GitHub
1. Create a new repository on GitHub
2. Upload your lab files to the repository
3. The `.devcontainer` folder is already configured for you

### Step 2: Create Codespace
1. Go to your GitHub repository
2. Click the green "Code" button
3. Select "Codespaces" tab
4. Click "Create codespace on main"
5. Wait for the environment to set up (5-10 minutes)

### Step 3: Run Your Lab
```bash
cd lab1/part1
./provided/capture_submission.sh
```

## Option 2: Gitpod 🌟

### Step 1: Create .gitpod.yml
```yaml
image: gitpod/workspace-full

tasks:
  - name: Setup Network Lab
    init: |
      sudo apt-get update
      sudo apt-get install -y curl wget git net-tools bridge-utils tshark python3 python3-pip
      curl -fsSL https://get.docker.com -o get-docker.sh
      sudo sh get-docker.sh --version 24.0.5
      sudo usermod -aG docker gitpod
      sudo bash -c "$(curl -sL https://get.containerlab.dev)"
      pip3 install scapy
    command: echo "Setup complete! Run: cd lab1/part1 && ./provided/capture_submission.sh"

ports:
  - port: 8080
    onOpen: ignore
```

### Step 2: Use Gitpod
1. Push your code to GitHub
2. Go to https://gitpod.io
3. Enter your repository URL
4. Gitpod will automatically set up the environment

## Option 3: Replit 🎯

### Step 1: Create Repl
1. Go to https://replit.com
2. Create a new "Bash" repl
3. Upload your lab files

### Step 2: Install Dependencies
```bash
# In Replit terminal
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo bash -c "$(curl -sL https://get.containerlab.dev)"
```

## Option 4: Cloud VM Services

### AWS EC2
1. Launch Ubuntu 22.04 instance
2. Install Docker and containerlab
3. Upload your lab files
4. Run the submission script

### Google Cloud Shell
1. Go to https://shell.cloud.google.com
2. Install Docker and containerlab
3. Upload your lab files
4. Run the submission script

## Your Lab is Ready! ✅

Your `do-lab.sh` file contains the correct bridge configuration:

```bash
#!/bin/bash

# Create a bridge on the switch node
docker exec clab-lab1-part1-switch ip link add name mybridge type bridge

# Bring the bridge up
docker exec clab-lab1-part1-switch ip link set mybridge up

# Add all 4 interfaces to the bridge
docker exec clab-lab1-part1-switch ip link set eth1 master mybridge
docker exec clab-lab1-part1-switch ip link set eth2 master mybridge
docker exec clab-lab1-part1-switch ip link set eth3 master mybridge
docker exec clab-lab1-part1-switch ip link set eth4 master mybridge
```

## Quick Start Commands

Once you're in any online environment:

```bash
# Navigate to lab directory
cd lab1/part1

# Run the submission script
./provided/capture_submission.sh

# Upload the generated submission.tgz to Coursera
```

## Troubleshooting

- **Docker issues**: Make sure Docker is running
- **Permission issues**: Use `sudo` if needed
- **Containerlab issues**: Make sure it's installed correctly

Your solution is complete and ready for submission! 🎉

