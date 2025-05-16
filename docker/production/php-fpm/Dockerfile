# Use the official PHP image with Alpine Linux
FROM php:8.4-fpm-alpine3.21

# Set working directory
WORKDIR /var/www

# Copy project files
COPY . .

# Set entrypoint script
RUN mv entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh

# Install dependencies and php extensions
RUN apk add --no-cache su-exec \
    && docker-php-ext-install \
        pdo_mysql

# Get composer from the official image
COPY --from=composer:2.8.8 /usr/bin/composer /usr/bin/composer

# Install composer dependencies
RUN composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 755 /var/www

# Set the user to run the application
USER www-data

# Set entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# expose the port that php-fpm listens on
EXPOSE 9000

# Start php-fpm
CMD ["php-fpm"]
