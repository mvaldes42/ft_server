mv ./usr/srcs/nginx.conf /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server

service nginx start
bash