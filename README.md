# FT_SERVER

## COMMANDS
`docker build -t mvaldes_image .`

`docker images`

`docker create --tty --interactive --name="mvaldes_container" mvaldes_image`

`docker ps -a`

`docker start mvaldes_container`

#docker run --name aname -it -p 80:80 -p 443:443 name

arreter proprement `docker stop` et limiter`docker kill`