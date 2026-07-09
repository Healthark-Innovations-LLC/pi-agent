#!/bin/bash 
# copies run.sh to your local bin

script="run.sh"
loop="run-loop.sh"
web="run-web.sh"

cd "$(dirname $0)"/../
set -xe 

rm -vf $(which pi) || sudo rm -vf $(which pi)

sudo cp -v $script /usr/bin/pi || sudo cp -v $script /usr/local/bin/pi
sudo chmod +rx /usr/bin/pi || sudo chmod +rx /usr/local/bin/pi

which pi && sudo chmod +rx $(which pi)

sudo cp -v $loop /usr/bin/pi-loop || sudo cp -v $loop /usr/local/bin/pi-loop
sudo chmod +rx /usr/bin/pi-loop || sudo chmod +rx /usr/local/bin/pi-loop

sudo cp -v $web /usr/bin/pi-web || sudo cp -v $web /usr/local/bin/pi-web
sudo chmod +rx /usr/bin/pi-web || sudo chmod +rx /usr/local/bin/pi-web

