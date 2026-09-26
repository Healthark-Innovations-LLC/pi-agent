#!/bin/bash

export PATH="/root/.pi/agent/bin:$PATH"

set -xe
exec pi --approve "$@"

