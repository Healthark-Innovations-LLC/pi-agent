#!/bin/bash
# build image 

set -xe

cd "$(dirname $0)"

bash build.sh
bash build-python.sh
bash build-antsable.sh

