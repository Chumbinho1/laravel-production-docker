# Use the official Node.js image as the base image for building the application
FROM node:22-alpine3.21 AS builder

# Set working directory
WORKDIR /var/www/app

# Copy project files
COPY . .

# Install dependencies
RUN npm install && npm run build

# Copy the build files to the nginx image
FROM nginx:1.28-alpine3.21

# Copy nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy project files
COPY --from=builder /var/www/app/public /var/www/app/public

# Set working directory
WORKDIR /var/www/app/public

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
