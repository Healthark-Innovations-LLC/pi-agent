#!/bin/bash
# build image 

image="pi-agent-python"

set -xe

cd "$(dirname $0)"

docker build "$@" -t $image:latest -f Dockerfile-python .
docker tag $image:latest pi-agent:latest

docker images | grep $image

