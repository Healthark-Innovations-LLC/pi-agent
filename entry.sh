#!/bin/bash

set -xe

if "$@"; then
  exec "$@"
fi

pi update

exec pi "$@"
