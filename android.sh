#!/bin/bash

choice=$(printf "Mount\nUnmount" | rofi -dmenu -p "What would you like to do?")
selected=$(simple-mtpfs -l | rofi -dmenu)
dev=$(echo $selected | cut -d':' -f 1)
name=$(echo $selected | cut -d':' -f 2)
case $choice in
	Mount) simple-mtpfs --device $dev $HOME/phone && notify-send "Devices" "$name mounted successfuly" --icon=/home/filip/media/icons/phone.png ;;
	Unmount) fusermount -u $HOME/phone && notify-send "Devices" "$name unmounted successfuly" --icon=/home/filip/media/icons/phone.png ;;
esac


exit

