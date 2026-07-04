#!/bin/bash 
# run agent in docker

image="pi-agent"

set -ex

docker rm -f $image

