#!/bin/bash
mkdir /var/www/ft_server
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#NGINX
cp ./usr/srcs/nginx.conf /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

#SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ft_server.crt \
-keyout /etc/nginx/ssl/ft_server.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mvaldes/CN=ft_server"

#DATABASE
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#phpMyAdmin
mkdir /var/www/ft_server/phpmyadmin
mkdir /var/www/ft_server/phpmyadmin/tmp
chmod -R 0777 /var/www/ft_server/phpmyadmin/tmp
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz --strip-components 1 -C /var/www/ft_server/phpmyadmin
mv /usr/srcs/phpmyadmin.inc.php /var/www/ft_server/phpmyadmin/config.inc.php
rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz

#WORDPRESS
wget https://wordpress.org/wordpress-5.7.1.tar.gz
tar xvf wordpress-5.7.1.tar.gz
rm -rf wordpress-5.7.1.tar.gz
mv wordpress/ /var/www/ft_server
cp /usr/srcs/wp-config.php /var/www/ft_server/wordpress

service php7.3-fpm start
service nginx start
service mysql start
bash