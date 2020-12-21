#!/bin/zsh

CURRENT=/home/filip/.cache/scripts/current_script_list
OLD=/home/filip/.cache/scripts/script_list
LINK=/home/filip/.cache/scripts/softlink
cd /home/filip/scripts && ls > $CURRENT && diff $CURRENT $OLD | awk '{print $2}' | tee $LINK| xargs -r chmod +x &&
cd /usr/local/sbin && sed 's/.sh//g' $LINK | xargs -r ln -s /home/filip/scripts/$LINK &&
cp $CURRENT $OLD 
