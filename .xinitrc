#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] &&  xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export _JAVA_AWT_WM_NONREPARENTING=1

export DESKTOP_SESSION=bspwm
# export DESKTOP_SESSION=plasma

case $DESKTOP_SESSION in
	plasma)
		exec startplasma-x11
		break
		;;
	bspwm)
		exec bspwm
		break
		;;
	*) echo "ERROR: Invalid selection"
		;;
esac
