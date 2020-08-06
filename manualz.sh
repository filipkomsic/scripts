#!/bin/sh

 
man -k . | dmenu -p 'KOJA TE KOMANDA ZANIMA?' -c -l 20 | awk "{print $1}" | xargs -r man -Tpdf | zathura -
