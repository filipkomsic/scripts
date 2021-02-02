#!/bin/bash

notify-send "REC"

if [ -f ~/out.mkv ]
then
	n=1
	while [ -f $HOME/out_$n.mkv ]
	do
		n=$((n+1))
	done
	filename="$HOME/out_$n.mkv"
else
	filename="$HOME/out.mkv"
fi


screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] && rez="1920x1080" || rez="1366x786"


ffmpeg \
	-f alsa -ac 2 -ar 44100 -i pulse \
	-f pulse -ac 2 -ar 44100 -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor \
	-filter_complex amix=inputs=2 \
	-f x11grab -s $rez -i :0.0 \
	-c:v libx264 -r 30 -preset veryfast -crf 18 \
	-c:a libmp3lame -ar 44100 $filename  & pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"

