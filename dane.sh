#!/bin/sh


printf "ø\nå\næ\nÅ\nÆ\nØ\n" | rofi -dmenu | xclip -sel clip || exit 0

