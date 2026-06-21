#!/bin/bash
# test image 

image="pi-agent"

set -xe

docker run --rm -it \
  --network agents \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-ssh:/root/.ssh \
  --entrypoint /bin/bash \
  $image
