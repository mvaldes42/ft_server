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

#phpMyAdmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
tar xvf phpMyAdmin-latest-english.tar.gz
mv phpMyAdmin-*/ /var/www/ft_server/phpMyAdmin
mv usr/local/srcs/phpmyadmin_config.inc.php /var/www/ft_server/phpMyAdmin
rm -rf phpMyAdmin-latest-english.tar.gz

#WordPress
wget https://wordpress.org/wordpress-5.7.1.tar.gz
tar xvf wordpress-5.7.1.tar.gz
mv wordpress/ /var/www/ft_server
chown -R www-data:www-data /var/www/ft_server
rm -rf wordpress-5.7.1.tar.gz
mv ./usr/srcs/wp-config.php /var/www/ft_server/wordpress

#Services start
service mysql start
service php7.3-fpm start

#CREATE DATABASE
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

service nginx start

bash