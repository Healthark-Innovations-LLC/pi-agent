#!/bin/bash

set -x

docker volume rm -f pi-agent
docker volume rm -f pi-agent-bin
docker volume rm -f pi-agent-sessions

