#!/bin/sh

tb=$(echo|rofi -dmenu -p "How many tabs you wish to bookmark?")
dsc=$(echo|rofi -dmenu -p "Description:")
printf "%s\n$dsc" >> "/home/filip/dox/notes/sort/bookmarks.md"
x=1

while [ $x -le $tb ]; do
	xdotool key Escape ctrl+l ctrl+c &&
		cliphandler.sh -b &&
	xdotool key ctrl+w &&
	x=$(($x + 1))
	sleep 1
done
