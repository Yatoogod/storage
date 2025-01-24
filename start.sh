#!/bin/bash

# Ensure rclone is installed
if ! command -v rclone &> /dev/null; then
  echo "Installing rclone..."
  curl https://rclone.org/install.sh | bash
fi

# Create a mount directory if it doesn't exist
MOUNT_DIR="/app/gdrive"
mkdir -p $MOUNT_DIR

# Mount Google Drive without daemon mode for debugging
echo "Mounting Google Drive..."
rclone mount gdrive: $MOUNT_DIR \
  --config /app/rclone.conf \
  --allow-other \
  --vfs-cache-mode writes

# Check if the mount was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to mount Google Drive."
  exit 1
fi

# Start the application
echo "Starting the application..."
npm start
