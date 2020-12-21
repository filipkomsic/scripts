#!/bin/zsh

#OLD OLD#

 #sed -i '$d' /home/filip/.profile && sxiv -t -o /home/filip/Multimedia/Foto-Video/wallpapers | tee -a /home/filip/.profile | xargs -r hsetroot -cover && sed -i '$s/^/hsetroot -cover /' /home/filip/.profile



####### CHANGE WALLPAPER WITHOUT WALL #######

du -al ~/media/wallpapers | awk '{print }' |xargs sxiv - -t -o |tee ~/.cache/scripts/current_wallpaper.txt|xargs -r hsetroot -cover

sed -i 's/^/"/g;s/$/"/g' ~/.cache/scripts/current_wallpaper.txt ;

NEW=$(sed 's|^|hsetroot -cover |g' ~/.cache/scripts/current_wallpaper.txt) &&
sed -i "10s|^.*$|$NEW \&|g" ~/.xinitrc

####### CHANGE WALLPAPER WITH WALL AND SET COLORSCHEME ######

#du -al ~/media/wallpapers | awk '{print }' |xargs sxiv - -t -o |tee ~/.cache/scripts/current_wallpaper.txt|xargs wal -i 
#
#sed -i 's/^/"/g;s/$/"/g' ~/.cache/scripts/current_wallpaper.txt ;
#
#NEW=$(sed 's|^|wal -i |g' ~/.cache/scripts/current_wallpaper.txt) &&
#sed -i "10s|^wal.*|$NEW \&|g" ~/.xinitrc
