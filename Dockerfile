# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvaldes <mvaldes@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 14:26:25 by mvaldes           #+#    #+#              #
#    Updated: 2021/04/14 14:26:25 by mvaldes          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# ENV AUTOINDEX on
LABEL "maintainer"="mvaldes" "project_name"="ft_server"

EXPOSE 80 443

RUN apt-get update && apt-get install -y \
	nginx && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN     echo "daemon off;" >> /etc/nginx/nginx.conf && \
        rm var/www/html/index.nginx-debian.html

# Je copie les configurations et scripts de mon système hôte vers mon image

# Giving nginx's user-group rights over page files
#RUN	chown -R www-data:www-data /var/www/html/*

#COPY srcs/*.sh ./

#CMD bash start.sh