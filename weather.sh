#!/bin/sh


[ "$(stat -c %y ~/.cache/scripts/weather | cut -d' ' -f1)" != "$(date '+%y-%m-%d')" ] &&
	curl https://wttr.in > ~/.cache/scripts/weather && echo "PRESS Q TO QUIT" >> ~/.cache/scripts/weather

pgrep -a st | grep scratchpad |cut -d' ' -f1| xargs -r kill ;

st -f fontawesome:medium:size=14 -t scratchpad -g 126x40 -e bat -p ~/.cache/scripts/weather  10

