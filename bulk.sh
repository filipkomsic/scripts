#!/bin/bash


let n=1
cat ~/.cache/scripts/bulknew |
	while read -r line; do
sed -i "$n s|$| $line|g" ~/.cache/scripts/bulkold
		n=$(($n + 1))
	done

sed -i "s/^/mv -vi /g" ~/.cache/scripts/bulkold

/home/filip/.cache/scripts/bulkold
