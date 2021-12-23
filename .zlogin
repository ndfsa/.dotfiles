#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
else
	echo "Not tty1, could start X server, BUT I REFUSE."
fi
