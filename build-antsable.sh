#!/bin/bash
# build image 

#image="pi-agent-antsable"
image="pi-agent"

set -xe

#bash build-python.sh

docker build "$@" -t $image:latest -f Dockerfile-antsable .

docker images | grep $image
