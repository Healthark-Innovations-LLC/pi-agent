#!/bin/bash
# build image 

image="pi-agent-antsable"

set -xe

#bash build-python.sh

docker build "$@" -t $image:latest -f Dockerfile-antsable .

docker images | grep $image
