#!/bin/sh
filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d; s/_/ /g; " |cut -d'.' -f 1| paste -sd ' ';}
pidof -x mpdup.sh >/dev/null 2>&1 || mpdup.sh >/dev/null 2>&1 &

case $BLOCK_BUTTON in
	1) echo "🎶" ; setsid -f "$TERMINAL" -e ncmpcpp ;;  # right click, pause/unpause
	2) echo "🎶" ;;  # right click, pause/unpause
	3) echo "🎶" ; current=$(mpc status | filter); notify-send "🎵 Currently playing:
$current";;
esac
