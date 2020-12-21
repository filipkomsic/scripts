#!/bin/bash

tmp=$(sed "s/...$//g; s/$/\ °C/g; s/^/🌡/g" /sys/class/thermal/thermal_zone1/temp)

echo $tmp

