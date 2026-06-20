#!/bin/bash
# test image 

set -xe

docker run --rm -it \
  --network agents \
  -p 0.0.0.0:3001:3001 \
  --memory-reservation=2g \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v pi-agent:/root/.pi \
  --entrypoint /bin/bash \
  pi-agent:latest
