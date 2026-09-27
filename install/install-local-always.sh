#!/bin/bash
# install pi locally (force install)

cd "$(dirname $0)"

set -xe

rm -vf $(which pi) || sudo rm -vf $(which pi)

bash pi-install-force.sh

bash install-local-common.sh

