#!/bin/bash

cd "$(dirname $0)"
set -xe 

if ! node -v ; then
  echo install node; 
fi 

npm install -g @earendil-works/pi-coding-agent

_HOME="/cygdrive/c/Users/Eric"
cp -v ../models.json "$_HOME"/.pi/agent/models.json

bash pi-extensions.sh

pi update
pi update --extensions

npm update

