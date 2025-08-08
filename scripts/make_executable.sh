#!/bin/bash
set -e
set -u

DEPLOY_DIR="/home/ubuntu/online-shop-app"

# Make sure directory exists before chmod
if [ -d "$DEPLOY_DIR/scripts" ]; then
    chmod +x "$DEPLOY_DIR/scripts/stop_container.sh" || echo "[WARN] stop_container.sh missing"
    chmod +x "$DEPLOY_DIR/scripts/start_container.sh" || echo "[WARN] start_container.sh missing"
else
    echo "[WARN] Scripts directory does not exist yet: $DEPLOY_DIR/scripts"
fi

# Ensure ubuntu user can access docker
if getent group docker >/dev/null 2>&1; then
    if ! id -nG ubuntu | grep -qw docker; then
        usermod -aG docker ubuntu
    fi
else
    echo "[WARN] docker group does not exist yet."
fi

# Log completion
echo "$(date): make_executable.sh completed" >> /tmp/deployment.log
