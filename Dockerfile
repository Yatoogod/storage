# Use a base image
FROM node:18

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Set the working directory
WORKDIR /app

# Copy all files into the container
COPY . .

# Ensure the startup script is executable
RUN chmod +x /app/start.sh

# Expose the app port (optional)
EXPOSE 3000  # Use the port required by your app

# Run the startup script
CMD ["/app/start.sh"]
