#!/bin/sh



xdotool search --name brave \
	key --window --sync %1 Escape g g  \
	mousemove --window  %1 200 200  \
	sleep 0.5
xdotool click --repeat 3 1  \
	key ctrl+x ctrl+l colon g Tab ctrl+v Return
	# key colon g Tab ctrl+v Return \


