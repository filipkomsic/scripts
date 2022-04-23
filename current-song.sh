#!/bin/bash

#STATE=$(mpc | awk 'FNR==2 { print $1 }') 
#YES=[playing]
#NO=[paused]


#if [ '$STATE' == '$NO' ] ; then
#	echo "⏸  |" && kill -47 $(pidof dwmblocks)
#else 
	while :
	do
		mpc idle > /dev/null;
		SONG=$(mpc current|sed "s/_/\ /g; s/.mp3//g; s/.webm//g");
		echo $SONG ; pkill --signal RTMIN+13 dwmblocks
	done ;
#fi





#if [ '$STATE' == '$NO' ] ; then
#       unset STATE
#fi

#printf $STATE >/dev/null &&
#       while :
#       do
#       	mpc idle > /dev/null;
#       	SONG=$(mpc current|sed "s/_/\ /g; s/.mp3//g; s/.webm//g");
#       	echo $SONG
#       done || echo "⏸  |" ;


#case $STATE in
#       [paused]) echo "⏸  |" ;  ;;
#       [playing])  while : 
#       do
#       	mpc idle > /dev/null ;
#       	SONG=$(mpc current|sed "s/_/\ /g; s/.mp3//g; s/.webm//g");
#       	echo $SONG 
#       done ;;
#sac 

# kill -47 $(pidof dwmblocks)
