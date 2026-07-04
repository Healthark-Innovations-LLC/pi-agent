#!/bin/bash
# install pi locally

cd "$(dirname $0)"

set -xe

rm -vf $(which pi) || sudo rm -vf $(which pi)

curl -fsSL https://pi.dev/install.sh | sh

bash pi-extensions.sh

pi update
pi update --extensions

npm update

cp -v models.json ~/.pi/agent/models.json
