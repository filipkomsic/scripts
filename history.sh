#!/bin/bash

cat $HOME/.zhistory | rofi -dmenu -l 15 -i | xclip -sel clip || exit 0
