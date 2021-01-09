#!/bin/bash
feh --bg-fill --randomize --recursive ~/Pictures/Wallpapers
killall picom
picom --experimental-backends --config ~/.config/picom/picom.conf &
