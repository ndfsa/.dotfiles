#!/bin/sh

killall picom
killall xmobar
picom --experimental-backgrounds --config ~/.config/picom/picom.conf &
