#!/bin/sh

dir="/home/filip/media/Muzika"

case $@ in
	'')

xdotool mousemove 563 80 \
	click --repeat 3 1 \
	key ctrl+c \
	mousemove restore

url=$(xclip -o -sel clip)
cd $dir || exit

youtube-dl --add-metadata -f bestaudio "$url" && notify-send "☑️ Song Downloaded" ;;
	-c) cd $dir || exit
url=$(xclip -o -sel clip)
youtube-dl --add-metadata -f bestaudio "$url" && notify-send "☑️ Song Downloaded" ;;
esac


