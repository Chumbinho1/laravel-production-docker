# Use the official PHP image with Alpine Linux
FROM php:8.4-fpm-alpine3.21

# Set working directory
WORKDIR /var/www/app

# Copy project files
COPY . .

# Install dependencies and php extensions
RUN docker-php-ext-install \
        pdo_mysql

# Get composer from the official image
COPY --from=composer:2.8.8 /usr/bin/composer /usr/bin/composer

# Install composer dependencies
RUN composer install --no-dev --optimize-autoloader

# Set entrypoint script
RUN mv entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && mv php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf

# Set correct permissions for storage and bootstrap/cache
RUN chown -R www-data:www-data /var/www/app \
    && chmod -R 755 /var/www/app

# Set the user to run the application
USER www-data

# Set entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# expose the port that php-fpm listens on
EXPOSE 9000

# Start php-fpm
CMD ["php-fpm"]
