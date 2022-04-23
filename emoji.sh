#!/bin/sh

# choose an emoji
cat /home/filip/.cache/scripts/emoji2 | rofi -dmenu -l 15 -e "Pick an emoji" -i | cut -d ';' -f 2 | tee /home/filip/.cache/scripts/selectedemoji |tr -d '\n'|tr -d ' '| xclip -sel clip
EMO=$(cat /home/filip/.cache/scripts/selectedemoji);
notify-send "$EMO has been copied to clipboard."


