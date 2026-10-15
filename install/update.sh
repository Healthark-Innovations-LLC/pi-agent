#!/bin/bash
# update pi, npm, and models

cd "$(dirname $0)"

set -xe

#git pull || echo

pi -v

bash install-local-common.sh

pi update
pi update --extensions

npm update

