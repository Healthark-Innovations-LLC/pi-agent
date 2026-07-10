#!/bin/bash

set -e

RESTORE="$(echo $@ | grep -oP '(?<=--name )[a-zA-Z0-9_-]*')"

set -x

if [[ ! -a $RESTORE ]]; then
  exec pi --approve -r "$@"
fi 

exec pi --approve "$@"

