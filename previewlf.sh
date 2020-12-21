#!/bin/sh

case "$1" in
	*.tar*) tar tf "$1";;
	*.zip) unzip -l "$1";;
	*.rar) unrar l "$1";;
	*.7z) 7z l "$1";;
	*.pdf) pdftotext "$1" -;;
	*) bat --color=always --decorations=always --theme=Dracula "$1";; 
	*.png) img.sh $1 0 0 30 30;;
	*.jpg) img.sh $1 0 0 30 30;;

esac
