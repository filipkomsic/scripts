#!/bin/sh

dir="$HOME/dox/notes/daily"
file="$dir/$(date +%m-%y.md)"

## Spawn notes in scratchpad
	# screen=$(xrandr|awk '/VGA/ {print $2}')
	# [ "$screen" = "connected" ] && rez="80x27+627-300" || rez="80x27+380-80"

# scratch() {

	# st -t scratchpad -g "$rez" -e nvim -c "norm Gzzo" \
	# 	-c "startinsert" "$file" ||
	# st -t scratchpad -g "$rez" -e nvim -c "norm Gzzo" \
	# 	-c "startinsert" "$file"; }


scratch() {

	st  -e nvim -c "norm Gzzo" \
		-c "startinsert" "$file" ||
	st -e nvim -c "norm Gzzo" \
		-c "startinsert" "$file"; }
new() {
	echo "# Noes from $(date +%d-%m)"; }


sin() {
	cat /dev/stdin >> "$file"; }

day=$(date +%d-%m)

grp(){
	cd /home/filip/dox/notes &&	sel=$(grep -Rn "^#.*" | grep -v 'Note\|sort' | rofi -dmenu -c -l 10 | awk -F: '{print "+"$2" "$1}')
if [ -z $sel ]; then
	exit
else
	echo "$sel" | xargs st -e nvim
fi
}

entro.sh

[ -f "$file" ] || new > "$file"

grep "# Notes from $day" "$file" >/dev/null || printf "\n# Notes from %s\n\n" "$day" >> "$file"

[ -p /dev/stdin ] && sin && exit

case $@ in
	'') scratch;;
	-n) st -e nvim -c "norm Gzzo" \
		-c "startinsert" "$dir/../workbench.md";;
	-c) xclip -o >> "$file";;
	-g) grp ;;
	-s) cd "/home/filip/dox/notes/sort" || exit ; find . | rofi -dmenu -l 10 | xargs -r st -e nvim -c "norm G"  ;;
	-f) st -e nvim "$file" ;;
	*) echo "$@" >> "$file";;
esac


