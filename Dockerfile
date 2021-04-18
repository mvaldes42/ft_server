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
	# mariadb-server \
	# php-mbstring php-fpm \
	wget && \
	# php-mysql && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

#PHP MY ADMIN
# RUN	wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz && \
# 	tar xvf phpMyAdmin-latest-english.tar.gz && \
# 	mv phpMyAdmin-*/ /var/www/html/phpmyadmin && \
# 	mv usr/local/srcs/phpmyadmin_config.inc.php /var/www/html/phpmyadmin && \
# 	rm -rf phpMyAdmin-latest-english.tar.gz

#RUN	chown -R www-data:www-data /var/www/html/*

CMD bash usr/srcs/init.sh