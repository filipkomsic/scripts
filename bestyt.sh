#!/bin/sh

norm(){

	pgrep -a ytfzf|grep -v subs|cut -d' ' -f1|xargs -r kill && st -e ytfzf -l -t

}

case $1 in
	-t) st -e ytfzf -t -l ;;
	-n) norm ;;
	-s) st -e ytfzf -c SI -t --sort ;;
esac
