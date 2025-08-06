#!/bin/bash
set -e

# Make scripts executable
chmod +x /home/ubuntu/online-shop-app/scripts/stop_container.sh
chmod +x /home/ubuntu/online-shop-app/scripts/start_container.sh

# Ensure ubuntu user can access docker (if not already in group)
if ! groups ubuntu | grep -q docker; then
    usermod -aG docker ubuntu
fi

# Log completion
echo "$(date): Scripts made executable" >> /tmp/deployment.log
