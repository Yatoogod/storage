# Use a Node.js base image (or any other base as needed)
FROM node:18

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Ensure the startup script is executable
RUN chmod +x /app/start.sh

# Expose the app's port (optional)
EXPOSE 3000  # Replace with your app's port

# Run the startup script
CMD ["/app/start.sh"]
