#!/bin/bash
# build image 

set -xe

bash build.sh

docker build "$@" -t pi-agent:latest -f Dockerfile-antsable .

docker images | grep pi-agent
