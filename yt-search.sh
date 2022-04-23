#!/bin/bash

keyword=$(rofi -dmenu -i -l 25 -c -p "Enter a search term: " || sed "s/\ /%20g")

url="https://www.youtube.com/results?search_query=$keyword"

id=$(curl $url | sed "s/:/\n/g" |
		grep -A 15 '{"thumbnails"' | grep -C 5 "title" |
		sed 's/}.*$//g; s/"//g; /^[1-9].*$/d; /^{.*$/d; /.*text.*$/d; /^https.*$/d; /^..url.*$/d' |
		cut -d'/' -f 5 | awk '{print}' ORS=' '  |
		sed 's/--/\n/g'|sed 's/^ *//; s/ /;/'|
		awk -F ";" '{print $2 "--" $1}'| rofi -dmenu -c -i -l 20 |
		awk -F "--" '{print $2}' )

play="https://www.youtube.com/watch?v=$id"

mpv $play

exit 0



