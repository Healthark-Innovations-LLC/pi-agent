#!/bin/bash
# build image 

image="pi-agent-python"

set -xe

bash build.sh

docker build "$@" -t $image:latest -f Dockerfile-python .

docker images | grep $image
