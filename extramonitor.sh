#!/bin/sh
screen=$(xrandr|awk '/VGA/ {print $2}')
if [ "$screen" = "connected" ]
then
# xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
#xrandr --addmode VGA-1 "1920x1080_60.00"
#xrandr  --output "VGA-1" --mode 1920x1080_60.00 --output "LVDS-1" --off &&
#xrandr  --output "VGA-1" --mode "1920x1080_60.00" --output "LVDS-1"  --right-of "VGA-1" --mode 1366x768
xrandr  --output "VGA1" --mode "1920x1080" --output "LVDS1"  --right-of "VGA1" --mode 1366x768

else
	exit
fi

case $@ in
	-1) xrandr  --output "VGA1" --mode "1920x1080" --output "LVDS1" --off ;;
esac
