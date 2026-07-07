#!/bin/bash
# run agent in docker

image="pi-agent"
prompt="$@"
mount="."

set -e

docker network create agents >/dev/null 2>&1 || :

set -xe

docker run --rm -it -d \
  --network agents \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-bin:/root/.pi/agent/bin \
  -v $image-ssh:/root/.ssh \
  -v $mount:/root/brain \
  $image -p "$prompt"
