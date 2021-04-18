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

EXPOSE 80 443

ADD	srcs /usr/srcs/

RUN	apt-get update && apt-get install -y \
	nginx \
	mariadb-server \
	php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring \
	php-curl php-xml php-pear php-bcmath \
	wget && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

CMD bash usr/srcs/init.sh