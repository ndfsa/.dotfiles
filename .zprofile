#!/bin/zsh

export PATH=$HOME/.local/bin:$HOME/bin:$PATH

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
else
	echo "Unable to start graphical environment, starting tty."
fi
