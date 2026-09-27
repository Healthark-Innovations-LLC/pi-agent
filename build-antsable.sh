#!/bin/bash
# build image 

image="pi-agent-antsable"

set -xe

docker build "$@" -t $image:latest -f Dockerfile-antsable .
docker tag $image:latest pi-agent:latest
docker image rm pi-agent-python

docker images | grep $image

