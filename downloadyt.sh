#!/bin/sh

dir="/home/filip/media/Muzika"

xdotool mousemove 563 80 \
	click --repeat 3 1 \
	key ctrl+c \
	mousemove restore

url=$(xclip -o -sel clip)
cd $dir

youtube-dl --add-metadata -f bestaudio $url && notify-send "☑️ Song Downloaded"


