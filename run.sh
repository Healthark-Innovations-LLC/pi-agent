#!/bin/bash 
# run agent in docker

image="pi-agent"

set -e

docker network create agents >/dev/null 2>&1 || :

set -xe

docker run --rm -it \
  --network agents \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-ssh:/root/.ssh \
  $image "$@"

