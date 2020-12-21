#!/bin/bash

xbacklight -get | cut -d '.' -f 1 | sed 's/$/\%/g'
