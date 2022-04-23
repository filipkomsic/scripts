#!/bin/sh

temp="$HOME/.cache/scripts/tempart.md"
web="$HOME/web/filipkomsic/sadrzaj"
template="$HOME/web/filipkomsic/sadrzaj/.template.html"
touch "$temp"

echo "---
title: '<+-+>'
author: '<+-+>'
date: '<+-+>'
keywords: '<+-+>'
css: '../style.css'
---" > "$temp"

xclip -o -sel clip >> "$temp" &&
	st -e nvim -c "norm I  " -c "norm l" -c "startinsert" "$temp" &&
		title=$(awk -F: '/^title/ {printf $2}' "$temp"|
		tr "[:upper:]" "[:lower:]"|
		sed "s/?//g;s/\!/ /g;s/'//g;s/^ //g;s/ /-/g;s/$/.html/g") &&
			touch "$web/$title" &&
				pandoc --template "$template" -o "$web/$title" "$temp" &&
				rm "$temp" &&
				blog.sh &&
				websync.sh
