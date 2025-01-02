#!/bin/bash
# exit when script returns a non-zero exit status
set -e


if [ ! -e .firstbuild ]; then
    echo "installing wp cli..."
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    chmod +x wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp
    touch .firstbuild
fi

# #Removing the 127.0.0.1 to listen on all available interfaces at port 9000
sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php83/php-fpm.d/www.conf
cd  /var/www/html
if [ ! -f wp-config.php ]; then
        echo "Installing WordPress..."
        wp core download --allow-root || true
        
        # Create wp-config.php
        wp config create --allow-root \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb"

        # Set Redis configuration for caching
        wp config set WP_REDIS_HOST redis
        wp config set WP_REDIS_PORT 6379 --raw
        wp config set WP_CACHE true --raw
        wp config set FS_METHOD direct

        #Installing WordPress site with configure admin user : 
        wp core install --allow-root \
        --url="$DOMAIN_NAME" \
        --title="$WORDPRESS_TITLE" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --skip-email # dont send email 

        # Create a regular user if it doesn't already exist
        if ! wp user get "$WORDPRESS_USER" --allow-root > /dev/null 2>&1; then
            wp user create "$WORDPRESS_USER" "$WORDPRESS_EMAIL" --role=author --user_pass="$WORDPRESS_PASSWORD" --allow-root
        fi
else
        echo "WordPress is already installed."
fi

chown -R nobody:nobody /var/www/html

exec php-fpm83 -F

echo "Starting PHP-FPM..."
