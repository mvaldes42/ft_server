#!/bin/bash
mv ./usr/srcs/nginx.conf /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-out /etc/nginx/ssl/ft_server.crt \
-keyout /etc/nginx/ssl/ft_server.key \
-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=mvaldes/CN=ft_server"

service nginx start
bash