#!/bin/bash
# run agent in a loop 

while true; do 
  pi -p "$@"
  sleep 1
done

