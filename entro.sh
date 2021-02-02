#!/bin/sh

find /home/filip/dox/notes/daily -type f | entr -z -p sortnot.sh &

