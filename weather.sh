#!/bin/sh


#[ "$(stat -c %y ~/.cache/scripts/weather | cut -d' ' -f1)" != "$(date '+%y-%m-%d')" ] &&
#	curl https://wttr.in/Roskilde > ~/.cache/scripts/weather

id=$(pgrep -a curl|grep wttr.in|awk '{print $1}')&& kill $id && exit||st  -t "scratchpad5" -g=150x40+400+200 -i -n wttr -e curl wttr.in/Roskilde 10

