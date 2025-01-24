# Use a base image
FROM node:18

# Install dependencies (including libfuse2)
RUN apt-get update && apt-get install -y \
    libfuse2 \
    fuse \
    && rm -rf /var/lib/apt/lists/*

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first (for npm install caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's source code
COPY . .

# Ensure the startup script is executable
RUN chmod +x /app/start.sh

# Expose the app port
EXPOSE 3000

# Run the startup script
CMD ["/app/start.sh"]
