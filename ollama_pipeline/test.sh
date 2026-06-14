#!/bin/bash
# test image 

set -xe

docker run --rm -it \
  -v pi-agent:/root/.pi \
  --entrypoint /bin/bash \
  pi-agent:latest

