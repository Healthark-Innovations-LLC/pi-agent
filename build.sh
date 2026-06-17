#!/bin/bash
# build image 

set -xe

docker build --no-cache -t pi-agent:latest -f Dockerfile .

docker images | grep pi-agent
