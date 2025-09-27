# Use official WordPress image as base
FROM wordpress:php8.2-apache

# Install required dependencies (optional: mysql-client, unzip, git, vim, etc.)
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libzip-dev unzip git mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (needed for pretty permalinks)
RUN a2enmod rewrite

# Copy custom PHP config (optional)
COPY ./php.ini /usr/local/etc/php/

# Copy custom WordPress plugins/themes (if you have them)
# Example: Copy your theme
# COPY ./themes/my-theme /var/www/html/wp-content/themes/my-theme
# Example: Copy your plugin
# COPY ./plugins/my-plugin /var/www/html/wp-content/plugins/my-plugin

# Ensure correct ownership
RUN chown -R www-data:www-data /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
