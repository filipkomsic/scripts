#!/bin/sh

datum() { \

	date +%a\ %d.%m.%Y
}

vrijeme() { \
	
	date +%R

}


while : ; do 

	xsetroot -name "| $(datum) | $(vrijeme)  |"

sleep 1m

done 
