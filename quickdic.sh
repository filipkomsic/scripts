#!/bin/sh


screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] && rez="80x27+627-600" || rez="80x27+380-80"


st -t scratchpad_dict -g "$rez" -e sdcv --color

