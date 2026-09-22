#!/bin/bash
# build image 

set -xe

bash build.sh
bash build-python.sh
bash build-antsable.sh

