#!/bin/bash 
# run agent in docker

image="pi-agent"

set -e

docker network create agents >/dev/null 2>&1 || :
docker rm -f $image >/dev/null || :

set -xe

docker run -it \
  --name $image \
  --network agents \
  --restart always \
  -v pi-agent:/root/.pi \
  $image 

