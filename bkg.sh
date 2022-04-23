#!/bin/bash

#OLD OLD#

 #sed -i '$d' /home/filip/.profile && sxiv -t -o /home/filip/Multimedia/Foto-Video/wallpapers | tee -a /home/filip/.profile | xargs -r hsetroot -cover && sed -i '$s/^/hsetroot -cover /' /home/filip/.profile



####### CHANGE WALLPAPER WITHOUT WALL #######

wal="/home/filip/.config/scripts/wallpaper"

setit() {
hsetroot -center $wal >>/dev/null
}
changeit(){
 cp $new $wal &&  setit
}
case $1 in
	-r) new=$(find ~/media/wallpapers |sed "s/^\/home.*wallpapers\/$//g"|shuf -n 1) && changeit;;
	-s) sleep 5 && hsetroot -cover "$HOME/.config/wallpaper"  && setit;;
	"") new=$(find ~/media/wallpapers | shuf |xargs sxiv - -t -o ) && changeit ;;
	*.jpg) new=$1 && changeit ;;
	*.png) new=$1 && changeit ;;
	*.jepg) new=$1 && changeit ;;
	*.img) new=$1 && changeit ;;
esac



#hsetroot -center $new >/dev/null && cp $new $wal






####### CHANGE WALLPAPER WITH WALL AND SET COLORSCHEME ######

#du -al ~/media/wallpapers | awk '{print }' |xargs sxiv - -t -o |tee ~/.cache/scripts/current_wallpaper.txt|xargs wal -i
#
#sed -i 's/^/"/g;s/$/"/g' ~/.cache/scripts/current_wallpaper.txt ;
#
#NEW=$(sed 's|^|wal -i |g' ~/.cache/scripts/current_wallpaper.txt) &&
#sed -i "10s|^wal.*|$NEW \&|g" ~/.xinitrc
