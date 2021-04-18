# FT_SERVER

### Utils
`docker ps -a` list all containers <br />
`docker images -a` list all images <br />

### Build an image
`docker build -t server_img .`

### Create & start a container
`docker create --tty --interactive --name="server_ctn" server_img` <br />
`docker start server_ctn`

### Stop, delete and clean
`docker system prune -f -a` to clean unused objects <br />
`docker container prune` to remove all stopped containers <br />
`docker container stop $(docker container ls -aq)` stop all containers <br />
`docker container rm $(docker container ls -aq)` remove all containers <br />
`docker image prune -a`remove all unused images <br />

## SOURCES

* [Install nginx on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-debian-10) <br />
* [nstall Linux, Nginx, MariaDB, PHP (LEMP stack) on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10) <br />
* Install phpMyAdmin on Debian 10 [here](https://www.itzgeek.com/how-tos/linux/debian/how-to-install-phpmyadmin-with-nginx-on-debian-10.html) or [here](https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10) <br />
* [Install WordPress with LEMP] (https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10) <br />
* [Create a self signed ssl certificate for nginx on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10) <br />