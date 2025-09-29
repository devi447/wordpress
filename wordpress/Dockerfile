# Base image: PHP 8.2 with Apache
FROM php:8.2-apache

# Install required PHP extensions for WordPress
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    mariadb-client unzip git vim \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite module (needed for WordPress permalinks)
RUN a2enmod rewrite

# Copy your complete WordPress project into the container
COPY . /var/www/html/

# Set correct ownership for Apache user
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
