#!/bin/bash
# build image 

image="pi-agent-python"

set -xe

docker build "$@" -t $image:latest -f Dockerfile-python .

docker images | grep $image

