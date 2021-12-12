#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
else
	echo "Unable to start graphical environment, starting tty."
fi
