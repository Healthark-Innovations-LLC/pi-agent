#!/bin/bash
# install pi locally

cd "$(dirname $0)"

set -xe

rm -vf $(which pi) || sudo rm -vf $(which pi)

curl -fsSL https://pi.dev/install.sh | sh

bash install-local-common.sh

