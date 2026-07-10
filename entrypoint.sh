#!/bin/bash

set -e

RESTORE="$(echo $@ | grep -oP '(?<=--name )[a-zA-Z0-9_-]*')"

set -x

if grep -r $RESTORE $HOME/.pi >/dev/null 2>&1 ; then
  exec pi --approve -r "$@"
fi 

exec pi --approve "$@"

