#!/bin/zsh

sed -i '$d' /home/filip/.profile && sxiv -t -o /home/filip/Multimedia/Foto-Video/wallpapers | tee -a /home/filip/.profile | xargs -r hsetroot -cover && sed -i '$s/^/hsetroot -cover /' /home/filip/.profile

