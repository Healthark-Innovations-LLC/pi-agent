#!/bin/bash
# install pi locally

cd "$(dirname $0)"

set -xe

rm -vf $(which pi) || sudo rm -vf $(which pi)

bash pi-install-force.sh

bash pi-extensions.sh

pi update
pi update --extensions

npm update

cp -v models.json ~/.pi/agent/models.json
