#!/bin/bash

RESTORE="$(echo $@ | grep -oP '(?<=--name )[a-zA-Z0-9_-]*')"

set -e

if [[ ! -z $RESTORE ]]; then
    if grep -r ".name.:.$RESTORE" $HOME/.pi >/dev/null 2>&1 ; then
	set -x
	exec pi --approve -r "$@"
    fi 
fi

set -x
exec pi --approve "$@"

