#!/bin/sh

# Copy .env if it doesn't exist
[ ! -f .env ] && cp .env.production .env

# Create Laravel storage dirs
mkdir -p storage/logs \
         storage/framework/cache \
         storage/framework/sessions \
         storage/framework/views \
         bootstrap/cache

# Execute the CMD as www-data
exec "$@"
