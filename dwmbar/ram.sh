#!/bin/bash

ram=$(free -h | awk '/^Mem:/ { print $3 "/" $2 }' | sed 's/Gi//; s/Gi/ GB/'  )
echo "💾 $ram"
case $BLOCK_BUTTON in
	1) st -t scratchpad2 -e htop ;;
esac
