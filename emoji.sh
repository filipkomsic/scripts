#!/bin/bash


# choose an emoji

cat /home/filip/.cache/scripts/emoji2 | dmenu -l 15 -p "Pick an emoji" -i | cut -d ';' -f 2 | tee /home/filip/.cache/scripts/selectedemoji | xclip -sel clip
#cat /home/filip/.cache/scripts/emoji2 |fzf|  cut -d ';' -f 2 | tee /home/filip/.cache/scripts/selectedemoji | xclip -sel clip
EMO=$(cat /home/filip/.cache/scripts/selectedemoji);

notify-send "$EMO has been copied to clipboard."


