#!/bin/bash
# build image 

image="pi-agent"

set -xe

docker build --no-cache "$@" -t $image:latest -f Dockerfile .

docker images | grep $image
