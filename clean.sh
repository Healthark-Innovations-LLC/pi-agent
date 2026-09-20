#!/bin/bash
# clean agent in docker

image="pi-agent-antsable"

set -xe

docker volume rm -f $image-sessions

