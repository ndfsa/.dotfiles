#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	if ! command -v startxfce4 &> /dev/null ; then
		export WM=bspwm
	else
		select opt in bspwm xfce4; do
			case $opt in
				bspwm)
					export WM=bspwm
					break
					;;
				xfce4)
					export WM=xfce4
					break
					;;
				*)
					echo "Invalid option"
					;;
			esac
		done
	fi
	exec startx
else
	echo "Not tty1, could start X server, BUT I REFUSE."
fi
