#!/bin/bash

cat $HOME/.zhistory | dmenu -l 15 -i | xclip -sel clip || exit 0
