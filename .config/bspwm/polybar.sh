#!/bin/sh

if $(pgrep -u $UID -x polybar >/dev/null); then
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
fi

"$HOME/.config/polybar/grayblocks/launch.sh"
