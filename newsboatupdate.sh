#!/bin/bash

ping -c 3 filipk.xyz && /usr/bin/newsboat -x reload & /usr/bin/notify-send "Newsboat" "Updating RSS feeds..." --icon=/home/filip/media/icons/rss.png || exit
