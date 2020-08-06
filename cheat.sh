#!/bin/sh

pgrep -a st | grep scratchpad | awk '{print $1}' | xargs -r kill && touch ~/.cache/scripts/cheat && echo  "KOJA TE KOMANDA ZANIMA?" | dmenu -fn fontawesome:large:size=25 -i -c -l 40  > ~/.cache/scripts/cheat && program=$(cat ~/.cache/scripts/cheat) && st -f fontawesome:medium:size=14 -t scratchpad -g 120x34 -e curl cheat.sh/$program 1






