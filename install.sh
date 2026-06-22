#!/bin/bash 
# copies run.sh to your local bin

script=run.sh

set -xe 

sudo cp -v $script /usr/bin/pi || sudo cp -v $script /usr/local/bin/pi
sudo chmod +x /usr/bin/pi || sudo chmod +x /usr/local/bin/pi
