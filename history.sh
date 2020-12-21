#!/bin/bash

cat $HISTFILE | dmenu -l 15 -i | xclip -sel clip || exit 0
