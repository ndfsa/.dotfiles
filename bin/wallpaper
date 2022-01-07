#!/bin/dash

MONITORS=`xrandr -q | rg " connected " | wc -l`

/bin/ls $HOME/Pictures/Wallpapers/* \
    | shuf \
    | tail -n $MONITORS \
    | xargs feh --bg-fill
