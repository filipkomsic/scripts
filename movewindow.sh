#!/bin/sh

case $1 in
	h) xdotool getactivewindow windowmove --relative -- -10 y ;;
	l) xdotool getactivewindow windowmove --relative 10 y ;;
	j) xdotool getactivewindow windowmove --relative x 10 ;;
	k) xdotool getactivewindow windowmove --relative -- x -10 ;;
	i) xdo resize -w +10 ;;
	a) xdo resize -h +10 ;;
	d) xdo resize -w -10 ;;
	o) xdo resize -h -10 ;;
esac
