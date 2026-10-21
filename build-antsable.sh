#!/bin/bash
# build image 

image="pi-agent-antsable"

set -xe

cd "$(dirname $0)"

docker build "$@" -t $image:latest -f Dockerfile-antsable .
docker tag $image:latest pi-agent:latest
docker image rm pi-agent-python

docker builder prune -f

docker images | grep $image

