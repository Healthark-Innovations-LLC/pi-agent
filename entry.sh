#!/bin/bash

set -xe

exec pi --approve "$(cat ~/brain/*.md)" "$@"
