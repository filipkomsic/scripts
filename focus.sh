#:!/bin/sh


dir="/home/filip/media/Muzika/focus"
shock="/home/filip/media/Muzika/Metallica-Master_Of_Puppets_.mp3"

skr=$(pwd)

[ -z "$dir" ] && prob=d
[ -z "$shock" ] && prob=s
[ -z "$dir" ] && [ -z "$shock" ] && prob=ds

case $prob in
	d) [ "$1" = "-d" ] ||

printf "\nPlease set a music directory using the -d flag.

Example:

focus.sh -d ~/music/focus" ; [ -z "$1" ] && exit ;;

	s) [ "$1" = "-i" ] ||

printf "\nPlease set an interruption song/sound using the -i flag.

Example:

focus.sh -i ~/music/metalica-master-of-puppets.mp3" ; [ -z "$1" ] && exit ;;

	ds) [ "$1" = "-?" ] ||

printf "\nPlease set a music directory and an interruption song/sound using the -d and -i flags.

Example:

focus.sh -d ~/music/focus
focus.sh -i ~/music/metalica-master-of-puppets.mp3" ; [ -z "$1" ] && exit ;;

esac

case $1 in
	s)  i=1
		while [ $i -le 3 ]
		do
			pgrep -d' ' play | xargs -r kill ; i=$((i+1)); sleep 0.4
			pgrep -d' ' -o focus | xargs -r kill
		done
		echo "You quitter.. 😠"  && exit 0 ;;
	-d) sed -i "s|^dir=.*$|dir=\"$2\"|g" "$skr"/focus.sh  ; exit ;;
	-i) sed -i "s|^shock=.*$|shock=\"$2\"|g" "$skr"/focus.sh  ; exit ;;
	t) pid=$(pgrep -a play | grep focus | awk '{print $1}')
		state=$(ps -o state= -p "$pid")
		[ "$state" = T ] &&
			kill -CONT "$pid" && exit ||
			kill -STOP "$pid" && exit ;;
	p)



# The argument focus.sh stop will stop the noise playing and the interuption



# Defining variables like dur of the focus, prefered noise/music

list=$(ls -1 "$dir")

genre=$(printf '%s
brownnoise
whitenoise
pinknoise' "$list" |
	rofi -dmenu  \
	-l 10 \
	-p "What do you want to listen to?") || exit 0

dur=$(rofi -dmenu  \
	-l 10 \
	-p "For how long you want to focus?") || exit 0

song=$(find "$dir"/"$genre" | shuf -n 1)

# Converts dur given in hours or minutes to seconds
case $dur in
	*m) durraw=$(echo "$dur"|sed 's/m//'); newdur=$((durraw*60)) ;;
	*h) durraw=$(echo "$dur"|sed 's/h//'); newdur=$((durraw*3600)) ;;
	*s) newdur=$(echo "$dur"|sed 's/s//') ;;
	 x) find "$dir"/"$genre" | shuf | while  read -r line ; do
		 				play "$line"
					done ; exit ;;
esac

# Depending on the genre of music/noise chosen it will play the correct one.

case $genre in
	brownnoise|whitenoise|pinknoise) play -n synth "$newdur" pinknoise ; play "$shock" trim 0 25 fade 0 25 4 vol 10db ;;
	jazz|classical|rain|nature|lofi|tech|ambiance) play "$song" trim 0 "$newdur" ; play "$shock" trim 0 25 fade 0 25 4 vol 10db ;;
esac & sleep 3 & pkill -RTMIN+11 "${STATUSBAR:-dwmblocks}"


esac

