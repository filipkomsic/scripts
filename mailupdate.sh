#!/bin/bash


net=$(ping -c 1 -q filipk.xyz >&/dev/null; echo $?)

[ $net -gt "0" ] && exit 0 || mbsync -a

pkill -RTMIN+18 "${STATUSBAR:-dwmblocks}"

exit


