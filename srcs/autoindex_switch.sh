#!/bin/bash
if grep -c 'autoindex off' /etc/nginx/sites-available/ft_server;
then
	sed -i -r 's/autoindex off/autoindex on/' /etc/nginx/sites-available/ft_server
else
	sed -i -r 's/autoindex on/autoindex off/' /etc/nginx/sites-available/ft_server
fi
service nginx reload