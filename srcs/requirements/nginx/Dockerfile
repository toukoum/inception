FROM debian:bullseye

RUN apt update -y && apt upgrade -y

# Install Nginx and necessary tools
RUN apt install -y nginx openssl vim curl

# Create SSL certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=rgiraud"

# Copy Nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports for HTTP and HTTPS
EXPOSE 443

# Set permissions
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
