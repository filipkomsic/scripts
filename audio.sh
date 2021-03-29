#!/bin/sh

pgrep pulsemixer && killall pulsemixer && exit || st -t scratchpad2 -g=80X24-3+5 -e pulsemixer

