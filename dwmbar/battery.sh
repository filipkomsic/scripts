#!/bin/sh

bat=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

case $state in
	Charging)emo="🔌" ;;
	Discharging)emo="🔋" ;;
	Unknown)emo="⚡️" ;;
esac

[ $bat -lt "25" ] && unset emo && emo="‼️" &&

	if [ $state = "Charging" ]
then
	unset emo && emo="🔌"
fi

bat=$(echo $bat|sed "s/$/%/g")

echo "$emo $bat"

