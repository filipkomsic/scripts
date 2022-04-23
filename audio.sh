#!/bin/sh

killall pulsemixer && exit || st -t "scratchpad" -g=120X34+2+3 -i -n Audio -e pulsemixer


