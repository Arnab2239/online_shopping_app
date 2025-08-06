#!/bin/bash

# Update package list
apt update -y

# Install Docker
apt install -y docker.io

# Start Docker service
systemctl start docker
systemctl enable docker

# Optional: Add 'ubuntu' user to docker group (if using non-root runs)
usermod -aG docker ubuntu
