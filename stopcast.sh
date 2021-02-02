#!/bin/bash

notify-send "REC STOPPED"
num=$(pgrep ffmpeg)
kill $num && sleep 1 &&
pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"
