#!/bin/sh




file=$(cd ~/Downloads/3D/references/ && ls -d $PWD/* | rofi -dmenu -i -p "Choose a directory:") &&
	MAX=$(printf "How many instances?" | rofi -dmenu) &&

for run in {1..$MAX}
do
sxiv -t -o $file | sxiv - &
done
