#!/bin/sh

# choose an emoji
cat /home/filip/.cache/scripts/emoji2 | dmenu -l 15 -p "Pick an emoji" -i | cut -d ';' -f 2 | tee /home/filip/.cache/scripts/selectedemoji | sed 's/[ \t]*$//g; s/^[ \t]*//g' | xclip -sel clip
EMO=$(cat /home/filip/.cache/scripts/selectedemoji);
notify-send "$EMO has been copied to clipboard."


