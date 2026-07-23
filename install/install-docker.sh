#!/bin/bash 
# copies run.sh to your local bin

docker="run.sh"
loop="run-loop.sh"
web="run-web.sh"
ro="run-readonly.sh"

cd "$(dirname $0)"/../
set -ex

chmod +rx *.sh

if sudo touch /usr/bin/.TOUCH 2>/dev/null ; then 
	sudo rm /usr/bin/.TOUCH

	sudo cp $docker /usr/bin/pi-docker
	sudo cp $docker /usr/bin/pi-d
	sudo cp $loop /usr/bin/pi-loop
	sudo cp $web /usr/bin/pi-web
	sudo cp $ro /usr/bin/pi-ro
fi

if sudo touch /usr/local/bin/.TOUCH 2>/dev/null ; then
	sudo rm /usr/local/bin/.TOUCH

	sudo cp $docker /usr/local/bin/pi-docker
	sudo cp $docker /usr/local/bin/pi-d
	sudo cp $loop /usr/local/bin/pi-loop
	sudo cp $web /usr/local/bin/pi-web
	sudo cp $ro /usr/local/bin/pi-ro
fi


