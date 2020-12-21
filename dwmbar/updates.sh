#!/bin/bash


net=$(ping -c 1 -q filipk.xyz >&/dev/null; echo $?)

[ $net -gt "0" ] && exit 0 ||

updates=$(checkupdates | wc -l )

echo "📦($updates)"

case $BLOCK_BUTTON in 
	3) notify-send "$(checkupdates)" ;;
esac

