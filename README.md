# Laravel Production Docker

## Description
This is a minimum Docker setup for running a Laravel application in a production environment. It includes Nginx, PHP-FPM, MySQL.

## Prerequisites
- Docker
- Docker Compose

## Getting Started 
1. Clone the repository:
   ```bash
    git clone https://github.com/Chumbinho1/laravel-production-docker.git
   
    cd laravel-production-docker
    ```
2. Copy the `.env.example` to `.env.production`:
   ```bash
    cp .env.example .env.production
   ```
3. Set up your environment variables in `.env.production`:
   ```bash
    nano .env.production
   ```
   - Set the `APP_KEY` to a random string. You can generate one or use this to test: `base64:Ci+XHe/fB3WHoakszw6IzwgALcC9iYgr+6Y20qcWdiI=`
   - Uncomment `WWWUSER`, `WWWGROUP` and `NODE_ENV`
4. Run the project:
   ```bash
    docker-compose -f docker/production/docker-compose.yml --env-file .env.production up --build 
   ```
5. Run the migrations:
   ```bash
    docker exec -it php-fpm php artisan migrate
   ```
6. Access the application:
   - Open your browser and go to `http://localhost:80` (or the port you specified in the `nginx/nginx.conf`).

## Customization
You can customize the Nginx and PHP-FPM configurations by modifying the files in the `nginx` and `php-fpm` directories, respectively.
