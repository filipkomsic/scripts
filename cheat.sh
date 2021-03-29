#!/bin/sh

#pgrep -a st | grep spterm | awk '{print $1}' | xargs -r kill


program=$(dmenu -p "Enter a command: " -c -i -l 40)  && st -t "scratchpad" -g=80X30+2+3 -i -n cheat -e curl cheat.sh/$program 1







