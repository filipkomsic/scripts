#!/bin/sh

cat ~/.cache/scripts/layouts | dmenu -p "Which keyboard layout should I switch to?" | xargs -r setxkbmap
