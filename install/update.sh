#!/bin/bash
# update pi, npm, and models

cd "$(dirname $0)"

set -xe

git pull || echo

pi update
pi update --extensions

npm update

cp -v ../models.json $HOME/.pi/agent/models.json

