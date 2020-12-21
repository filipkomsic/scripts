#!/bin/bash

mute=$(pulseaudio-ctl full-status |awk '{print $2}')

[ $mute == "yes" ] && echo "🔇" ||

volume=$(pulseaudio-ctl full-status | awk '{print $1}')
 
[ $volume -lt "40" ] &&  icon="🔈" || 

	if [ $volume -gt "70" ]
then
	icon="🔊" 
else
	icon="🔉"
fi

echo "$icon $volume%"


case $BLOCK_BUTTON in 
	1) st -t scratchpad2 -e pulsemixer ;;
esac
