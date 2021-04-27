# FT_SERVER

## HOW TO RUN THE PROJECT
### Start the container
Check if ports 80 and 443 are already used : <br />
`sudo lsof -i -P -n | grep LISTEN `<br />
Close those services : <br />
`sudo service <nginx> stop`<br />

Then make and run container : <br />
`sh run.sh`

### Turn on/off autoindex
`docker exec -it server_ctn /bin/bash` <br />
>$`sh usr/srcs/autoindex_switch.sh`

### Stop, delete and clean all
`sh clean.sh`

## COMMANDS
### Utils
`docker ps -a` list all containers <br />
`docker images -a` list all images <br />

### (alternative) Build an image
`docker build -t server_img .`

### (alternative) Create & start a container
`docker create --tty --interactive --name="server_ctn" server_img` <br />
`docker start server_ctn`

### (alternative) Stop, delete and clean
`docker system prune -f -a` to clean unused objects <br />
`docker container prune` to remove all stopped containers <br />
`docker container stop $(docker container ls -aq)` stop all containers <br />
`docker container rm $(docker container ls -aq)` remove all containers <br />
`docker image prune -a`remove all unused images <br />

## SOURCES

* [Install nginx on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10) <br />
* [Install Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10) <br />
* Install phpMyAdmin on Debian 10 [here](https://www.itzgeek.com/how-tos/linux/debian/how-to-install-phpmyadmin-with-nginx-on-debian-10.html) or [here](https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10) <br />
* [Install WordPress with LEMP](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10) <br />
* [Create a self signed ssl certificate for nginx on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10) <br />
* [Install Docker on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04) <br />