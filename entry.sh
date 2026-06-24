#!/bin/bash

set -xe

exec pi "$(cat ~/brain/AGENTS.md)" "$@"

