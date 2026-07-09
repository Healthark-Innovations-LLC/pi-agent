#!/bin/bash

cd "$(dirname $0)"

set -xe

find * -name "*.sh" | xargs dos2unix

