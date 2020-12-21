#!/bin/bash

dir="$HOME/dox/notes/daily"
file=$(date +%d-%m-%y.md)

cd $dir


if [ -f $file ]
then
	st -t scratchpad -g 80x27+380-80 -e nvim -c "norm G2o## $(date +%H:%M)" \
		-c "norm G2o" \
		-c "norm zz" \
		-c "norm :Goyo|set linebreak" \
		-c "startinsert" $file 
else
	touch $file
	echo "## Notes for $(date +%d-%m-%y)" > $file && 
	st -t scratchpad -g 80x27+360-80 -e nvim -c "norm G2o## $(date +%H:%M)" \
	-c "norm G2o"
	-c "norm zz" \
	-c "norm :Goyo|set linebreak" \
	-c "startinsert" $file
fi


