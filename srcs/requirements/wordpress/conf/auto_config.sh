#!/bin/bash


sleep 10

if  [ -f "./wp-config.php" ]; then 
	exit
fi

wp config create --allow-root   --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin-user$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

if  [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi
