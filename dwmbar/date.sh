#!/bin/sh

date +%a\ %d\ %b\ %Y\ 

	dan=$(date -u +%d)
cal=$(cal -m -w -3)
cal2=$(cal -m -w | sed "s/$dan/[$dan]/g")

	case $BLOCK_BUTTON in
		1) setsid -f "$TERMINAL" -e calcurse ;; #open calendar
		2)  notify-send "$cal" ;; #display calendar
		3)  notify-send "$cal2" ;; #display calendar
	esac
