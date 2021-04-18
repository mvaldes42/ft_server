# FT_SERVER

### Utils
`docker ps -a` list all containers
`docker images -a` list all images

### Build an image
`docker build -t server_img .`

### Create & start a container
`docker create --tty --interactive --name="server_ctn" server_img`
`docker start server_ctn`

### Stop, delete and clean
`docker system prune -f -a` to clean unused objects
`docker container prune`to remove all stopped containers
`docker container stop $(docker container ls -aq)` stop all containers
`docker container rm $(docker container ls -aq)`remove all containers
`docker image prune -a`remove all unused imagesc