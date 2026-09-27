#!/bin/bash
# run local pi agent in a loop 

while true; do 
  set -x
  pi -p "$@"
  set +x
  sleep 1
done

