#!/bin/sh



xdotool search --name brave \
	mousemove --window %1 517 200 \
	click --repeat 3 1 \
	key ctrl+c \
	key ctrl+l \
	key colon g Tab ctrl+v Return \


