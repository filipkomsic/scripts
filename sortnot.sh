#!/bin/sh

dir="$HOME/dox/notes"
tmp="$HOME/.cache/scripts/trijaza"
pth=$(pwd)
bo="$dir/sort/books.md"
mo="$dir/sort/movies.md"
td="$dir/sort/todo.md"
mu="$dir/sort/music.md"
co="$dir/sort/commands.md"
di="$dir/sort/dict.md"
#HERE GOES NEW SORT FILE -- DON'T DELETE



clean() {
	case $1 in
		-c) sed "s/$2/- [ ] /g" ;;
		-b) sed "s/$2/*/g" ;;
		-l) sed "s/$2/-/g" ;;
		-C) sed "s/$2 /\n\n/g" ;;
	esac
}

new() {

	tag=$(cut -d' ' -f1 | sed "s/@+//g")
	name=$(cut -d' ' -f2)
	content=$(cut -d' ' -f3-)
	location=$( echo "$tag" | sed "s|$|=\"$dir/sort/$name\"")
comment="#HERE GOES NEW SORT FILE -- DON'T DELETE"
	comment2="#NEW CASE -- DON'T DELETE"
	kejs=$(echo "@$tag" | sed "s/$/\*) echo \"\$line\" | clean -l @$tag >> \"\$$tag\" ;;/g")
	sed -i "s|$comment|$location\n$comment|g ;
		s|$comment2|$kejs\n$comment2|g" "$pth"/sortnot.sh
		echo "@$tag $content" | clean -l @"$tag" >> $(echo "$location" |sed "s|^.*=//g")
}

grep -h ^@ "$dir"/daily/* > "$tmp"

while read -r line
do
	case $line in
		@bo*) echo "$line" | clean -l @bo >> "$bo" ;;
		@mo*) echo "$line" | clean -l @mo >> "$mo" ;;
		@td*) echo "$line" | clean -l @td >> "$td" ;;
		@mu*) echo "$line" | clean -l @mu >> "$mu" ;;
		@co*) echo "$line" | clean -l @co >> "$co" ;;
		@di*) echo "$line" | clean -l @di >> "$di" ;;
		@+??*) echo "$line" | new ;;
	esac
done < "$tmp"

sed -i "/^@.*$/d" "$dir"/daily/*
