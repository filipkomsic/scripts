#!/bin/sh

dir="/home/filip/web/filipkomsic"
art="sadrzaj"
tdir="teme"
tmp=".tmpt"
out=".tmpo"
shab="teme/.scheme"
index="index.html"

cd $dir || exit

awk 2>/dev/null '
        /<title>/ {printf "\n" FILENAME $0};
        /keywords/ {printf $0}; /<meta.*date/ {printf $0}' "$art"/*html |
		sed "s/<meta.*keywords\" content=[\"']/|/g
			s/<meta.*date\" content=[\"']/|/g
			s/<title>/|/g
			s|</title>||g
			s/\"//g
			s/>//g
			s/\(\s\+\|[\"']>$\)/ /g
			s/^\s*//
			s/,//g
			s/ |/|/g;/^$/d" | sort -r -n -t"|" -k4.9 -k4.10 -k4.4 -k4.5 -k4.1 -k4.2 > "$out"

topics=$(cat "$out" | cut -d '|' -f 3 | xargs -n1 | sort -u)

rm "$tmp"
echo "$topics" |
	while read -r tema; do
		echo "$tema" |
			sed "s/^/<li><a href=\"\/teme\//;s/$/.html\">$tema<\/a><\/li> /;s/$tema/\u&/2" >> "$tmp" #priremi teme za index
					cont=$(awk 2>/dev/null -v pat="$tema"  -F\| '$0~pat{print "<li>"$4" <a href=\"/"$1"\">"$2"</a></li>"}' $out | sort -n -r -t"." -k3 -k2 -k1 | tr -d '\n' | sed "s/^/<\!--CLANCI-->/") #formatiraj clanke zasvaku temu, sortiraj po datumu
					file="teme/$tema.html"
					if [ -f "$file" ]; then
						sed -i "s|^.*<!--CLANCI-->.*$|$cont|" "$file"
					else
						cp "$shab" "$file"||exit
						sed -i "s/^.*<title>.*$/\t\t<title>Tema: $tema<\/title>/;s/^.*<h1>.*$/\t\t\t<h1>Tema: $tema<\/h1>/;s|^.*<!--CLANCI-->.*$|$cont|" "$file"
					fi

		done

replacement=$(cat "$tmp" | tr -d '\n' | sed "s/^/<\!--TEME-->/")
sed -i "s|^<!--TEME-->.*$|$replacement|" "$index"
sed -i "s|^<!--TEME-->.*$|$replacement|" "$tdir"/*html


cat $out | cut -d '|' -f1,3 |
	while read -r clanak; do
		clnk=$(echo $clanak | cut -d '|' -f1)
		cnt=$(echo $clanak | cut -d'|' -f2 | tr ' ' '\n' |
			awk '{print "<li><a href=../teme/"$1".html>"$1"</a></li>" }' |
			tr -d '\n$' | sed "s/^/<\!--TAGOVANO--><ul id=tagged>/; s|$|</ul>|" )
		sed -i "s|^<!--TAGOVANO-->.*$|$cnt|g" "$clnk"
	done

	blg=$(head -n 5 $out | awk -F\| '{print "<li>"$4"- <a href="$1">"$2"</a></li>"}' | tr -d '\n$' | sed "s/^/<\!--BLOG--><ul>/; s|$|</ul>|") && sed -i "s|^<\!--BLOG-->.*$|$blg|" "$index"
