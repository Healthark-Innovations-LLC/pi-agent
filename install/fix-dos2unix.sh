#!/bin/bash

cd "$(dirname $0)"

cd ..

set -xe

find * -name "*.sh" | xargs dos2unix

