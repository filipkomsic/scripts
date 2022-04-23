#!/bin/sh

list=$(find scripts -type f -exec grep -Iq . {} \; -print | grep -v git\ )

reg=$(echo|dmenu -p "Enter a search or regex term:")

echo "$list" | while read -r line; do
			grep -i "$reg" "$line"
		done

