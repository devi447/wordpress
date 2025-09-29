# Base image: PHP 8.2 with Apache
FROM php:8.2-apache

# Install required PHP extensions and MySQL client
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    unzip git vim \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite module (needed for WordPress permalinks)
RUN a2enmod rewrite

# Copy WordPress files (but skip wp-config.php so it’s mounted later)
COPY . /var/www/html/
RUN rm -f /var/www/html/wp-config.php

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
