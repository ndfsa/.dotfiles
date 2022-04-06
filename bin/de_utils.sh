#!/bin/dash

[ -e $HOME/.fehbg ] && $HOME/.fehbg
systemctl --user start wm.target
systemctl --user start wallpaper.timer

killall -q xss-lock
while pgrep -u $(id -ru) -x xss-lock > /dev/null ; do sleep 0.5 ; done
xset s 600
xss-lock slock &

killall -q playerctld
while pgrep -u $(id -ru) -x playerctld > /dev/null ; do sleep 0.5 ; done
playerctld &

killall -q picom
while pgrep -u $(id -ru) -x picom > /dev/null ; do sleep 0.5 ; done
picom --experimental-backends --config "$HOME/.config/picom/picom.conf" &
