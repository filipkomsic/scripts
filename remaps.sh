#!/bin/sh

# This script is called on startup to remap keys.
# Increase key speed via a rate change
xset r rate 200 50
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
# Clear Mod5Mask key
xmodmap -e "clear mod5"
# Set spacebar for Mod5Mask
xmodmap -e "add mod5 = space"

