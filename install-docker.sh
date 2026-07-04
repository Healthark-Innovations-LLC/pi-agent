#!/bin/bash 
# copies run.sh to your local bin

script="run.sh"
daemon="run-daemon.sh"

set -xe 

rm -vf $(which pi) || sudo rm -vf $(which pi)

sudo cp -v $script /usr/bin/pi || sudo cp -v $script /usr/local/bin/pi
sudo chmod +rx /usr/bin/pi || sudo chmod +rx /usr/local/bin/pi

which pi && sudo chmod +rx $(which pi)

sudo cp -v $daemon /usr/bin/pi-daemon || sudo cp -v $daemon /usr/local/bin/pi-daemon
sudo chmod +rx /usr/bin/pi-daemon || sudo chmod +rx /usr/local/bin/pi-daemon
