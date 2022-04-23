#!/bin/sh

# Functions

bup(){
[ "$dst" = 1 ] && exit ||
	cur=$(ls -1 | grep -E "[0-9]" | cut -d '-' -f 1 | sort -nr)
	n=$(($cur+1))
	new=$(echo "$file" | sed "s/^.*-/$n-/g")
	cp "$file" "$new"
	file="$new"
}

use(){
echo "This is how you use it"
}


rand() {
	fileSize=$(wc -c < "$file")
	headerSize=1000
	skip=$(shuf -i "$headerSize"-"$fileSize" -n 1)
	count=$(shuf -i 1-10 -n 1)
	for i in $(seq 1 $count);do byteStr=$byteStr'\x'$(shuf -i 0-255 -n 1); done;
	printf $byteStr | dd of="$file" bs=1 seek=$skip count=$count conv=notrunc >/dev/null 2>&1


# steps=$(shuf -i 40-70 -n 1)
# for i in $(seq 1 $steps);do datamosh "$file"; done

}



voi() {
if [ -f sample.wav ]; then
	n=1
	while [ -f sample_$n.wav ]
	do
		n=$((n+1))
	done
	sample="sample_$n.wav"
else
	sample="sample.wav"
fi



echo "The recording will start in:"
x=3

while [ "$x" -gt 0 ]; do
	echo "$x"
	x=$(($x-1))
	sleep 1
done

ffmpeg -f jack -i ffmpeg -t 00:10 $sample

sleep 1

linez=$(wc -l < $sample)
linez2=$(wc -l < "$file")
shuf -i 0-"$linez" -n 10 | shuf > /tmp/rand1
shuf -i 0-"$linez2" -n 10 | shuf > /tmp/rand2

x=1
while [ "$x" -le 10 ]; do
			lin1=$(sed -n "$x p" /tmp/rand1 )
			lin2=$(sed -n "$x p" /tmp/rand2 )

			cont=$(sed -n "$lin1 p" $sample | tr -d '/')
			sed -i "$lin2 s/.*/$cont/" "$file"
			x=$(($x+1))
		done
	}


while getopts ":d:f:h:" option; do
	case "$option" in
		h) use && exit ;;
		d) dst=1 ;;
		f) orig="$OPTARG" ;;
	esac
done


[ -z "$orig" ] && use && exit ||
dir=$(echo "$orig" | cut -d '.' -f 1)
file="1-$dir.bmp"
mkdir "$dir"
mv "$orig" "$dir"/"$orig"
cd "$dir" || exit
expr "$orig" : '^.*bmp$' >/dev/null && sleep 0.01 || convert "$orig" "$file"

figlet "Environment Initiated!"

while [ "$choice" != "break" ]; do

choice=$(printf "voice\nrandomize\nbreak" |fzf --border=horizontal --height=30% -i --layout=reverse --prompt="How would you like to glitch?")

case $choice in
	voice) bup && voi ;;
	randomize) bup && rand ;;

esac

		done




