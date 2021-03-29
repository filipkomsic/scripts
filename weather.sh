#!/bin/sh


[ "$(stat -c %y ~/.cache/scripts/weather | cut -d' ' -f1)" != "$(date '+%y-%m-%d')" ] &&
	curl https://wttr.in/Roskilde > ~/.cache/scripts/weather

st -e bat -p ~/.cache/scripts/weather  10

