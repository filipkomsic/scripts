#!/bin/bash

shortcuts="/home/filip/.config/scripts/shortcuts-raw"
jumpzsh="/home/filip/.cache/scripts/shortcuts-jump-zsh"
fczsh="/home/filip/.cache/scripts/shortcuts-fc-zsh"
jumplf="/home/filip/.cache/scripts/shortcuts-jump-lf"
xdir="/home/filip/.cache/scripts/shortcuts-dirdow"
sxdir="/home/filip/.cache/scripts/shortcuts-sxhkd"

#ZSH

## CD
while read -r; do
	sed "s/^/alias\ g/g; s/\t/='cd\ /g; s/$/; ls'/g"
done < $shortcuts > $jumpzsh

## EDIT
while read -r; do
	sed "s/\t/(){\ cd\ /g; s/$/\nfind \. | grep -v \.git | fzf | sed 's|^|\"|g;s|$|\"|g' | xargs -r xdg-open || exit}/g"
done < $shortcuts > $fczsh

# LF
while read -r; do
	sed "s/^/map\ g/g; s/\t/\ cd\ /g"
done < $shortcuts > $jumplf

# Dir Dow
while read -r; do
	sed "s|\t|) dir=\"|g;s|$|/\" \;\;|g"
done < $shortcuts > $xdir && sed -i '1s/^/case $choice in \n/g;s|\~|/home/filip|g' $xdir && printf 'esac' >> $xdir


