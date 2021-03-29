#!/bin/sh


printf "ø\nå\næ\nÅ\nÆ\nØ\n" | dmenu | xclip -sel clip || exit 0

