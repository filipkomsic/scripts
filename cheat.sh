#!/bin/sh

#pgrep -a st | grep spterm | awk '{print $1}' | xargs -r kill


program=$(rofi -dmenu -p "Enter a command: ")  && st -t "scratchpad" -g=120X34+2+3 -i -n cheat -e curl cheat.sh/$program 1










