#!/bin/bash

source "`ueberzug library`" 

ImageLayer 0< <(
	ImageLayer::add [identifier]="example0" [x]="$2" [y]="$3" [max_width]="$5" [max_height]="$4" [path]="$1"
	read 
)
