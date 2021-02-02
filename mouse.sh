#!/bin/sh

case $1 in
	-l) xdotool mousemove_relative 5 0 ;;
	-h) xdotool mousemove_relative -- -5 -0 ;;
	-j) xdotool mousemove_relative 0 5 ;;
	-k) xdotool mousemove_relative -- -0 -5 ;;
esac
