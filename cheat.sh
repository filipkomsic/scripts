#!/bin/sh

#pgrep -a st | grep spterm | awk '{print $1}' | xargs -r kill 

touch ~/.cache/scripts/cheat 

program=$(dmenu -p "Enter a command: " -c -i -l 40)  && st -t "scratchpad" -g=80X30+2+3 -i -n cheat -e curl cheat.sh/$program 1






