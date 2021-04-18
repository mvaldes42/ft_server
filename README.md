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
`docker container prune`to remove all stopped containers <br />
`docker container stop $(docker container ls -aq)` stop all containers <br />
`docker container rm $(docker container ls -aq)`remove all containers <br />
`docker image prune -a`remove all unused images <br />