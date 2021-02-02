#!/bin/bash

engine=$(printf "
duckduckgo
searx
youtube
translate
stackexchange
google
github
archwiki
acronym" | dmenu -l 20 -c -p "Enter a search term: ")

[ -z $engine ] && exit 0 ||

term=$(dmenu -c -p "Enter a search term: " )

[ -z $term ] && exit 0 ||

case $engine in
	duckduckgo) sr duckduckgo $term ;;
	searx) sr searx $term ;;
	youtube) sr youtube $term ;;
	translate) sr translate -from=auto -to=en $term ;;
	stackexchange) echo $term | sed "s/^/"/;s/$/"/;s/ /+/g" | xargs sr stack ;;
	google) sr google $term ;;
	archwiki) sr archwiki $term;;
	acronym) sr acrtonym $term ;;
	github) sr github $term ;;
esac

