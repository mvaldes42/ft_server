# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvaldes <mvaldes@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 16:09:19 by mvaldes           #+#    #+#              #
#    Updated: 2021/04/17 16:09:19 by mvaldes          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ADD	srcs /usr/srcs/

RUN	apt-get update && apt-get install -y \
	nginx \
	mariadb-server \
	php-fpm php-mysql \
	php-json php-mbstring \
	wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN	chown -R www-data:www-data /var/www/html/*

CMD bash usr/srcs/init.sh