#!/bin/sh
set -e

echo "Starting Container"

# Start PHP-FPM in the background (daemon mode)
echo "Starting PHP-FPM..."
php-fpm -D

# Give PHP-FPM a moment to start
sleep 1

# Start Nginx in the foreground
echo "Starting Nginx..."
exec nginx -g "daemon off;"
