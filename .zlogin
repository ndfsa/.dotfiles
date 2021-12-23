#!/bin/zsh

SESSIONS=('bspwm')

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	command -v startplasma-x11 &> /dev/null || SESSIONS+=('plasma')
	[ 1 -eq "${#SESSIONS[@]}" ] \
		&& export DESKTOP_SESSION=bspwm \
		&& select opt in bspwm plasma; do
			[ -n "$opt" ] && export DESKTOP_SESSION="$opt" && break
		done
	exec startx
else
	echo "Not tty1, could start X server, BUT I REFUSE."
fi
