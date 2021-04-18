#!/bin/bash
#NGINX for PHP PROCESSOR
mkdir /var/www/ft_server
chown -R $USER:$USER /var/www/ft_server

# activate nginx config
cp ./usr/srcs/nginx.conf /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/

#test php config
cp ./usr/srcs/info.php /var/www/ft_server/info.php
rm /etc/nginx/sites-enabled/default

#SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/ft_server.crt \
-keyout /etc/nginx/ssl/ft_server.key \
-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mvaldes/CN=ft_server"


service mysql start
service php7.3-fpm start
service nginx start
bash