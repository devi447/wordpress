# Use official WordPress base image with PHP + Apache
FROM wordpress:php8.1-apache

# Install extra PHP extensions if needed
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Set working directory
WORKDIR /var/www/html

# Copy your WordPress source code (themes, plugins, wp-config, etc.)
# If you have a project repo with WordPress, uncomment the below line
# COPY . /var/www/html/

# Set proper permissions for WordPress
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
