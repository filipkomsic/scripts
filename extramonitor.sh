#!/bin/sh
screen=$(xrandr|awk '/VGA/ {print $2}')
[ "$screen" = "connected" ] &&
xrandr  --output "VGA1" --mode 1920x1080_60.00 --output "LVDS1" --auto --right-of "VGA1" || exit
