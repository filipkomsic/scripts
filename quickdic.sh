#!/bin/sh


screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] && rez="80x27+627-600" || rez="80x27+380-80"


killall sdcv && exit||st  -t "scratchpad2" -g=120x33+475+220 -i -n stardict -e sdcv --color
