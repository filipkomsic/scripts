#!/bin/sh

# This script is called on startup to remap keys.
# Increase key speed via a rate change
xset r rate 200 50
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

## OLD SPACE REBIND ##

# Clear Mod5Mask key
# Set spacebar for Mod5Mask
# xmodmap -e "clear mod5"
# xmodmap -e "add mod5 = space"

## NEW  SPACE REBIND ##
# when space is held it's mod5, when pressed once it's space
sparemod="Hyper_L"
xmodmap -e "keycode 65 = $sparemod"
xmodmap -e "remove mod4 = $sparemod"
xmodmap -e "add mod5 = $sparemod"
xmodmap -e "keycode 99 = space"
xcape -e "$sparemod=space"

