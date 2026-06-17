#!/bin/bash

set -xe

if "$@"; then
  exec "$@"
fi

exec pi "$@"
