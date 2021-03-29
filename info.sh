#!/bin/sh

dir="$HOME/.cache/scripts/info"

cd $dir
find . | dmenu | xargs -r cat | xclip -sel clip
