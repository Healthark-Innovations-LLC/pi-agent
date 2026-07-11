#!/bin/bash
# run agent in docker

image="pi-agent"
mount="."
folder=$(basename "`pwd`" | sed 's/ /-/g')
name="pi-web"

set -e

docker network create agents >/dev/null 2>&1 || :
docker rm -f "$name" >/dev/null 2>&1 || :

docker run --rm -it \
  --name "$name" \
  --network agents \
  -p 0.0.0.0:80:3001 \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-bin:/root/.pi/agent/bin \
  -v $image-ssh:/root/.ssh \
  -v $mount:/root/brain \
  $image --name "$folder" "$@" 

