#!/bin/bash
feh --bg-fill --randomize --recursive ~/Pictures/Wallpapers/safe
killall picom
picom --experimental-backends --config ~/.config/picom/picom.conf &
