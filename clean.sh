#!/bin/bash
docker container stop $(docker container ls -aq)
docker system prune -f -a