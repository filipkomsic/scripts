#!/bin/sh

dir="$HOME/dox/notes/daily"
file="$dir/$(date +%m-%y.md)"

	screen=$(xrandr|awk '/VGA/ {print $2}')
	[ "$screen" = "connected" ] && rez="80x27+627-300" || rez="80x27+380-80"

scratch() {

	st -t scratchpad -g "$rez" -e nvim -c "norm Gzzo" \
		-c "startinsert" "$file" ||
	st -t scratchpad -g "$rez" -e nvim -c "norm Gzzo" \
		-c "startinsert" "$file"; }

new() {
	echo "# Noes from $(date +%d-%m)"; }


sin() {
	cat /dev/stdin >> "$file"; }

day=$(date +%d-%m)


entro.sh

[ -f "$file" ] || new > "$file"

grep "# Notes from $day" "$file" >/dev/null || printf "\n# Notes from %s\n\n" "$day" >> "$file"

[ -p /dev/stdin ] && sin && exit

case $@ in
	'') scratch;;
	-c) xclip -o >> "$file";;
	-s) cd "/home/filip/dox/notes/sort" || exit ; find . | dmenu -l 10 | xargs -r st -t scratchpad -g "$rez" -e nvim ;;
	-f) st -e nvim "$file" ;;
	*) echo "$@" >> "$file";;
esac


