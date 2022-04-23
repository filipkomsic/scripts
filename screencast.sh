#!/bin/bash

notify-send "REC"

screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] && rez="1920x1080" || rez="1366x786"


record(){

if [ -f ~/out.mp4 ]
then
	n=1
	while [ -f $HOME/out_$n.mp4 ]
	do
		n=$((n+1))
	done
	filename="$HOME/out_$n.mp4"
else
	filename="$HOME/out.mp4"
fi



ffmpeg \
	-thread_queue_size 1024 \
	-f jack -i ffmpeg \
	-f x11grab -s "$rez" -r 30 -i :0.0 \
	-c:a libopus -ac 2 -b:a 128k \
 	-c:v libx264 -preset ultrafast -crf 19 -tune film  $filename & pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"

}

stream(){


ffmpeg \
	-thread_queue_size 1024 \
	-f jack -i ffmpeg \
	-f x11grab -s "$rez" -r 30 -i :0.0 \
	-c:a libmp3lame -ar 44100 -ac 2 \
 	-c:v libx264 -preset ultrafast -crf 19 -tune film  \
	-f flv "rtmp://a.rtmp.youtube.com/live2/2gwq-ujfr-fuey-zmkd-c24e"

}

case $1 in
	record) record;;
	stream) stream;;
	*)exit ;;
esac
 	#-c:v libx264 -preset ultrafast -crf 19 -tune film  $filename & pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"


	#-c:a libopus -b:a 48k -vbr on -compression_level 10 -frame_duration 60 -application \
 	#-c:v libx264 -preset ultrafast -crf 19 -tune film $filename & pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"



	#-c:a libopus -ac 2 -b:a 128k \

	#-c:a libmp3lame -ac 2 -b:a 48k -ar 44100 -af aresample=async=1:min_hard_comp=0.100000:first_pts=0 \

	#-acodec libmp3lame -ac 2 -b:a 40k -ar 44100 -af aresample=async=1:min_hard_comp=0.100000:first_pts=0 \

# ffmpeg \
# 	-f alsa -ac 2 -ar 44100 -i pulse \
# 	-f pulse -ac 2 -ar 44100 -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor \
# 	-filter_complex amix=inputs=2 \
# 	-f x11grab -s $rez -i :0.0 \
# 	-c:v libx264 -r 30 -preset veryfast -crf 18 \
# 	-c:a libmp3lame -ar 44100 $filename  & pkill -RTMIN+14 "${STATUSBAR:-dwmblocks}"

