#!/bin/sh
set -e

echo "Starting Container"

# Start PHP-FPM in the background (daemon mode)
echo "Starting PHP-FPM..."
php-fpm -D

# Start Nginx in the foreground
# Note: Nginx will handle PHP-FPM connection failures gracefully
echo "Starting Nginx..."
exec nginx -g "daemon off;"
