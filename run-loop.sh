#!/bin/bash
# run agent in a loop 

while true; do 
  set -x
  pi -p "$@"
  set +x
  sleep 1
done

