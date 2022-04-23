#!/bin/bash

ram=$(free -h | awk '/^Mem:/ { print $3 "/" $2 }' | sed 's/Gi//; s/Gi/ GB/'  )
echo "💾 $ram"
case $BLOCK_BUTTON in
	1) st -t "scratchpad" -g=120X34+2+3 -i -n cheat -e htop ;;
esac

