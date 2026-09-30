#!/bin/bash
# common things to execute

cd "$(dirname $0)"

set -xe

# ensure PATH is set up
_SHELL=$(echo $SHELL)
_PATH='export PATH="$HOME/.pi/agent/bin:$PATH"'
_PROFILE=""

# zsh (mac os)
if [[ $_SHELL == "/bin/zsh" ]]; then
	_PROFILE="$HOME/.zsh"
fi 

# bash
if [[ $_SHELL == "/bin/bash" ]]; then
	_PROFILE="$HOME/.bashrc"
fi 

# set PATH
if [[ ! -z "$_PROFILE" ]]; then
	if ! grep "$_PATH" "$_PROFILE"; then
		echo >> "$HOME/.zsh"
		echo "$_PATH" >> "$HOME/.zsh"

		if [[ -d '/usr/local/bin' ]]; then
			echo 'export PATH="/usr/local/bin/:$PATH"' >> "$HOME/.zsh"
		fi
	fi
fi



# copy models.json
mkdir -p "$HOME/.pi/agent"
cp -v ../models.json "$HOME/.pi/agent/models.json"


# install pi extensions
bash pi-extensions.sh


# update pi
pi update
pi update --extensions

npm update

exit 0

