#!/bin/sh

choice=$(echo "
search
tag"|rofi -dmenu)

[ -z "$choice" ] && exit

general="
inbox ; 📥
todo ; ✅
važno ; ❗️
general ; ⚙️
ljudi ; 👥️
mape ; 🗺"

cath="
knjiga ; 📚
podcast ; 🎧
video ; 📽
članak ; 📰
misli ; 💭
bilješke ; 🗒"

state="
sjeme ; 🌱
klica ; 🌿️
inkubator ; 🌞️
vazdazeleno ; 🌲️"

paste(){
	xclip -sel clip && xdotool key alt+v BackSpace Escape
}

filter(){
	case $1 in
		-t) cut -d';' -f2|tr -d ' '| sed "/^$/d"|tr  '\n' '/'|sed "s/\/$//g" ;;
		-s) cut -d';' -f2|tr -d ' '| sed "/^$/d"|tr -d '\n' ;;
	esac
}
tagging(){
	general=$(echo "$general"|rofi -dmenu -multi-select|filter -t)
	[ -z "$general" ] && exit
	cath=$(echo "$cath"|rofi -dmenu -multi-select|filter -t)||exit
	[ -z "$cath" ] && exit
	state=$(echo "$state"|rofi -dmenu -multi-select|filter -t)||exit
	[ -z "$state" ] && exit
	echo "$general|$cath|$state"|paste
}

searching(){
	sel=$(echo "$general
		$cath
		$state"|rofi -dmenu -multi-select|filter -s)
		[ -z "$sel" ] && exit
	echo "$sel"|paste
	}

case "$choice" in
	tag) tagging ;;
	search) searching ;;
esac
