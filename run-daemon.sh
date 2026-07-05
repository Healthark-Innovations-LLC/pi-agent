#!/bin/bash
# run agent in docker

image="pi-agent"
prompt="$@"
mount="."
WEBUI_RUNNING="false"

set -e

docker network create agents >/dev/null 2>&1 || :
docker rm -f $image >/dev/null 2>&1 || :

set -xe

docker run -it \
  --name $image \
  --restart always \
  --network agents \
  -p 0.0.0.0:80:3001 \
  -p 0.0.0.0:3001:3001 \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-bin:/root/.pi/agent/bin \
  -v $image-ssh:/root/.ssh \
  -v $mount:/root/brain \
  $image
