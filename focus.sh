#!/bin/bash

# The argument focus.sh stop will stop the noise playing and the interuption

case $1 in
	stop)  i=1; while [[ $i -le 2 ]]; do pgrep play | xargs -r kill ; let ++i; sleep 0.5; done; echo "You quitter.. 😠" ; exit 0 ;;
esac


# Defining variables like duration of the focus, prefered noise/music

TYPE=$(printf "brownnoise\nwhitenoise\npinknoise\nclassical\njazz\nlofi\nrain\nnature\n" | dmenu -c -l 10 -p "What do you want to listen to?") || exit 0  
TIME=$(dmenu -c -l 10 -p "For how long you want to focus?") || exit 0
DIR=/home/filip/media/Muzika/focus
SHOCK=/home/filip/media/Muzika/Metallica-Master_Of_Puppets_.mp3
SONG=$(du -al $DIR/$TYPE | awk '{print $2}' | shuf -n 1)

# Converts time given in hours or minutes to seconds

case $TIME in
	*m) TIMERAW=$(echo $TIME|sed 's/min//'); NEWTIME=$(echo $((TIMERAW*60))); ;;
	*h) TIMERAW=$(echo $TIME|sed 's/h//'); NEWTIME=$(echo $((TIMERAW*3600))); ;;
	*s) NEWTIME=$(echo $TIME|sed 's/sec//'); ;;
esac

# Depending on the type of music/noise chosen it will play the correct one.

case $TYPE in 
	brownnoise) play -n synth $NEWTIME brownnoise ; play $SHOCK trim 0 25 fade 0 25 4 vol 10db ;;
	whitenoise) play -n synth $NEWTIME whitenoise ; play $SHOCK trim 0 25 fade 0 25 4 vol 10db ;;
	pinknoise) play -n synth $NEWTIME pinknoise ; play $SHOCK trim 0 25 fade 0 25 4 vol 10db ;;
	jazz) play $SONG trim 0 $NEWTIME ; play $SHOCK trim 0 25 fade 0 25 4 vol 10db ;;
	classical) play $SONG trim 0 $NEWTIME ; play $SHOCK trim 0 24 fade 0 25 4 vol 10db ;;
	rain) play $SONG trim 0 $NEWTIME ; play $SHOCK trim 0 24 fade 0 25 4 vol 10db ;;
	nature) play $SONG trim 0 $NEWTIME ; play $SHOCK trim 0 24 fade 0 25 4 vol 10db ;;
	lofi) play $SONG trim 0 $NEWTIME ; play $SHOCK trim 0 24 fade 0 25 4 vol 10db ;;
esac



