#!/bin/sh


dsc=$(echo|rofi -dmenu -p "Description:")
tb=$(echo|rofi -dmenu -p "How many tabs you wish to bookmark?")
printf "%s\n$dsc" >> "/home/filip/dox/notes/sort/bookmarks.md"

case "$tb" in
	1) xdotool key Escape ctrl+l ctrl+c && cliphandler.sh -b && exit;;
	*) x=1
		while [ $x -le $tb ]; do
			xdotool key Escape ctrl+l ctrl+c &&
			cliphandler.sh -b &&
			xdotool key ctrl+w &&
			x=$(($x + 1))
			sleep 1
		done ;;
esac
