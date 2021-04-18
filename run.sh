#!/bin/bash
docker build -t server_img . && \
docker stop server_ctn || true && \
docker rm server_ctn || true && \
docker run -it --name server_ctn -d -p 80:80 -p 443:443 server_img