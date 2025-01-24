#!/bin/bash

# Ensure rclone is installed
if ! command -v rclone &> /dev/null; then
  echo "Installing rclone..."
  curl https://rclone.org/install.sh | bash
fi

# Create a mount directory
MOUNT_DIR="/app/gdrive"
mkdir -p $MOUNT_DIR

# Mount Google Drive using rclone
echo "Mounting Google Drive..."
rclone mount gdrive: $MOUNT_DIR \
  --config /app/rclone.conf \
  --allow-other \
  --vfs-cache-mode writes \
  --daemon

# Start the application
echo "Starting the application..."
npm start  # Replace with your app's actual start command
