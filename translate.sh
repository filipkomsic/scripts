#!/bin/sh

screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] &&
	cor1="1780 45" &&
	cor2="1500 130" &&
	cor3="1800 280" &&
	# cor1="1200 45" &&
	# cor2="900 130" &&
	# cor3="1320 280" &&


xdotool search --name brave \
	mousemove --window %1 1780 45 \
	click 1 \
	mousemove --window %1 1500 130 \
	--delay 500 \

xdotool search --name brave \
	click --clearmodifiers  --repeat 2  1 \
	mousemove --window %1 1800 280 \
	click 1
