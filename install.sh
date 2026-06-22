#!/bin/bash 
# copies run.sh to your local bin

script=run-mnt.sh

set -xe 

sudo cp -v $script /usr/bin/pi
sudo chmod +x /usr/bin/pi

