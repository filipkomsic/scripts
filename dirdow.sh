#!/bin/sh

choice=$(cat ~/.config/scripts/shortcuts-raw | awk '{print $1}' |
	dmenu -c -l 20)


. /home/filip/.cache/scripts/shortcuts-dirdow

xdotool search --name "Save File" \
	mousemove --window %1 75 25 \
	click 1 \
	type "$dir"


xdotool search --name "Save File" \
	mousemove --window %1 839 540


