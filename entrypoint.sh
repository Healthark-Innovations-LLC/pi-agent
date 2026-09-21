#!/bin/bash

export PATH="/root/.pi/agent/bin:$PATH"

#set -x

RESTORE="$(echo $@ | grep -oP '(?<=--name )[a-zA-Z0-9_-]*')"

set -e

if [[ ! -z $RESTORE ]]; then
    if grep -r ".name.:.$RESTORE" $HOME/.pi/agent/sessions >/dev/null 2>&1 ; then
	set -x
	exec pi --approve -r "$@"
    fi 
fi

set -x
exec pi --approve "$@"

