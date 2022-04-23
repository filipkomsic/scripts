cd ~/dox/bigbrain/articles
ls -lt | grep -E "May|Feb" | cut -d':' -f 2 | cut -d ' ' -f 2 | tr -d ' ' |
	while read -r line; do
pdftotext "$line" - | grep -i "$@" ;
done

