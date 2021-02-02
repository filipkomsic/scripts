#!/bin/sh
filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d; s/_/ /g; " |cut -d'.' -f 1| paste -sd ' ';}
pidof -x mpdup.sh >/dev/null 2>&1 || mpdup.sh >/dev/null 2>&1 &

sng=$(pgrep -a play | grep focus)
if [ -z "$sng" ]
then
	echo "🎶 $(filter)"
else
	gnr=$(echo $sng | cut -d' ' -f3 | cut -d'/' -f6,7 ) && echo " 🦅 $gnr"
fi

case $BLOCK_BUTTON in
	1) echo "🎶 $(filter  )" ; setsid -f "$TERMINAL" -e ncmpcpp ;;  # right click, pause/unpause
	2) echo "🎶 $(filter  )" ;;  # right click, pause/unpause
	3) echo "🎶 $(filter  )"; current=$(mpc status | filter); notify-send "🎵 Currently playing:
$current";;
esac
