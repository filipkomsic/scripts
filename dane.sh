#!/bin/sh


printf "å\næ\nø\nÅ\nÆ\nØ\n" | dmenu | xclip -sel clip || exit 0

