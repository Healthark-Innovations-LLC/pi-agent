#!/bin/bash
# update pi, npm, and models

cd "$(dirname $0)"

set -xe

git pull

pi update
npm update

cp -v ../models.json $HOME/.pi/agent/models.json

