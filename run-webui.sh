#!/bin/bash 
# run agent in docker

image="pi-agent"

set -e

docker network create agents >/dev/null 2>&1 || :
docker rm -f $image >/dev/null || :

set -xe

docker run --rm -it \
  --name $image \
  --network agents \
  -p 0.0.0.0:3001:3001 \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-bin:/root/.pi/agent/bin \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-ssh:/root/.ssh \
  $image "$@"

