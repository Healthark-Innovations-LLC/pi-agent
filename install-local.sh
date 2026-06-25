#!/bin/bash
# install pi locally

cd "$(dirname $0)"

set -xe

curl -fsSL https://pi.dev/install.sh | sh && \
    pi update

cp -v models.json ~/.pi/agent/models.json
