#!/bin/bash
# run agent in docker

image="pi-agent"
prompt=""
mount_path=""

# Parse arguments
while getopts "p:m:" opt; do
  case "$opt" in
    p) prompt="$OPTARG" ;;
    m) mount_path="$OPTARG" ;;
    *) echo "Usage: $0 [-p prompt] [-m mount]" ; exit 1 ;;
  esac
done

# explain this
shift $((OPTIND-1))

set -e

docker network create agents >/dev/null 2>&1 || :

set -xe

docker run --rm -it \
  --network agents \
  --shm-size=2g \
  -v //var/run/docker.sock:/var/run/docker.sock \
  -v $image-bin:/root/.pi/agent/bin \
  -v $image-sessions:/root/.pi/agent/sessions \
  -v $image-ssh:/root/.ssh \
  ${mount_path:+--volume $mount_path:/mnt} \
  $image "$@"

