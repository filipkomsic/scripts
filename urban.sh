#!/bin/sh


WORD=$( echo | rofi -dmenu -l 30 -p "Pick a term.." | sed "s/ /$20/g" )


curl "https://www.urbandictionary.com/define.php?term=$WORD" > ~/.cache/scripts/urban &&
w3m -dump -T text/html ~/.cache/scripts/urban | head -100 | sed "s/Top definition/~/g; s/Flag/~/g" |
grep -oPz "(?s)~.*?~" | tr '\0' '\n' | sed "s/\n//g; s/~//g; s/^[0-9]*//g" | rofi -dmenu -l 100
