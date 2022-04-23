#!/bin/sh

bmk="/home/filip/dox/notes/sort/bookmarks.md"

action() {
	case $clip in
	echo) fajl=$(echo|rofi -dmenu -i -p "Enter file path" | sed 's|^|/home/filip/|g')
		xclip -o -sel clip | sed "s/^/\n/g" >> "$fajl" ;;
	translate) prevedi=$(xclip -o -sel clip)
		lang=$(printf "en\nhr\nda\nla\nfr\nde\nit" | rofi -dmenu -p "Translate to:" )
		sr translate -from=auto -to="$lang" "$prevedi";;
	browse) link=$(xclip -o -sel clip| sed "s/^/\"/g; s/$\"/g")
		brave-nightly "$link";;
	termclip) xdotool key Escape A apostrophe Escape I e c h o space apostrophe Escape A space bar x c l i p space minus s e l space c l i p Return

		;;
	note)
		cd ~/dox/notes/sort || exit
		choice=$(ls -1|rofi -dmenu -i -p "Where to output clipboard?" -l 10)
		case $choice in
			commands.md)desc=$(echo|rofi -dmenu -p "Description:"|sed "s/^/\n/g")
					content="$desc$(xclip -o -sel clip|sed "s/^/\n/g" )";;
				*) content=$(xclip -o -sel clip|sed "s/^/-/g; s/^/\n/g") ;;
			esac


		echo "$content" >> "$choice" ;;
	bookmark) desc=$(echo|rofi -dmenu -p "Description:") && bar=$(xclip -o -sel clip) && printf "%s\n#$desc%s\n$bar" >> $bmk;;
	auto-bookmark)bar=$(xclip -o -sel clip) && printf "%s\n$bar" >> $bmk;;
	blog)

	esac
}

proceed() {
	clip=$(printf "echo\ntranslate\nbrowse\nbookmark\nnote\ntermclip\\blog" | rofi -dmenu -i -p "What to do with clipboard?") && action
}

case $@ in
	-b) clip="auto-bookmark" && action && exit ;;
	'') proceed ;;
esac



