#!/bin/sh

if $(pgrep -u $UID -x conky >/dev/null); then
    killall -q conky
    while pgrep -u $UID -x conky >/dev/null; do sleep 1; done
else
    conky
fi
