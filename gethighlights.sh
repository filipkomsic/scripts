#!/bin/sh

out=$(echo $1|cut -d'.' -f1)
grep .bmp $1|cut -d'"' -f2| while read -r item; do
				tesseract "$item" - |tr -d '\n'|sed "s/$/\n\n/g" >> "$out".md
			done && sed -i 's/\o14//g' "$out".md


