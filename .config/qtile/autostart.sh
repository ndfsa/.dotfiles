#!/bin/bash
killall picom
picom --experimental-backends --config ~/.config/picom/picom.conf &
