#!/bin/sh

if $(pgrep -u $UID -x polybar >/dev/null); then
    killall -q polybar
    bspc config top_padding 0
else
    "$HOME/.config/polybar/grayblocks/launch.sh"
fi
