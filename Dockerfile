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

# Expose the app port (3000 is used as an example; replace it with your actual app port)
EXPOSE 3000

# Run the startup script
CMD ["/app/start.sh"]
