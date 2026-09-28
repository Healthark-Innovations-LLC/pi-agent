#!/bin/bash
# build image 

image="pi-agent"

set -xe

python3 generate_models_config.py

docker build --no-cache "$@" -t $image:latest -f Dockerfile .

docker images | grep $image

