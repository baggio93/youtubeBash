#!/bin/bash 
function aiuto {
	echo "Andare sul canele youtube sezione video e copiare URL per avere la lista di video che si possono scaricare \nyoutubeDownload.sh URL"
           }
function morelink {
	tfile=$1
	urlajax=$(cat /tmp/$tfile | grep "data-uix-load-more-href" | cut -f 3 -d'"')
	echo $urlajax
	fileajax=$(mktemp -u ajax.XXX)
	wget -O /tmp/$fileajax "https://www.youtube.com$urlajax"
	cat /tmp/$fileajax | sed 's/\\n/\n/g' | sed 's/\\u003c\\/</g' | sed 's/\\u003c/</g' | sed 's/\\u003e/>/g' | sed 's/\\"/"/g' > /tmp/$tfile
	cat /tmp/$tfile | grep '<h3 class="yt-lockup-title ">' | sed 's/"/\n/g' | grep "watch?v" | sed 's/^.//'> /tmp/$tlistURL
        cat /tmp/$tfile | grep '<h3 class="yt-lockup-title ">' | sed 's/"/\n/g' | grep -A1 "title=" | sed '/--/ d' | sed '/title=/ d'> /tmp/$tlistTitle
        cat /tmp/$tfile | grep '<span class="video-time" aria-hidden="true"><span aria-label="' | cut -d'>' -f4 | cut -d'<' -f1 > /tmp/$tlistTime
        paste /tmp/$tlistTitle /tmp/$tlistTime > /tmp/$tlistTitleTime
        rm /tmp/$fileajax
}

if [ -z "$@" ]; then
	aiuto
	exit
fi
tfile=$(mktemp -u listYoutube.XXX)
tlistURL=$(mktemp -u listURL.XXX)
tlistTitle=$(mktemp -u listTitle.XXX)
tlistTime=$(mktemp -u listTime.XXX)
tlistTitleTime=$(mktemp -u listTitleTime.XXX)
wget -O /tmp/$tfile $1 -nv
cat /tmp/$tfile | grep '<h3 class="yt-lockup-title ">' | sed 's/"/\n/g' | grep "watch?v"> /tmp/$tlistURL
cat /tmp/$tfile | grep '<h3 class="yt-lockup-title ">' | sed 's/"/\n/g' | grep -A1 "title=" | sed '/--/ d' | sed '/title=/ d'> /tmp/$tlistTitle
cat /tmp/$tfile | grep '<span class="video-time" aria-hidden="true"><span aria-label="' | cut -d'>' -f4 | cut -d'<' -f1 > /tmp/$tlistTime
paste /tmp/$tlistTitle /tmp/$tlistTime > /tmp/$tlistTitleTime
num=0
while [ $num == 0 ] ; do
	nl -nrz -w2 /tmp/$tlistTitleTime
	echo $'0\tCarica altro'
	read -p "Inserire numeri di video da scricare separati da virgola: " num
	if [ $num == 0 ] ; then
		morelink $tfile
	fi
done

#echo "-$num-"

if [ "$num" != "" ]; then
	num=$(echo $num | sed 's/,/\n/g')
	for i in $num; do
		link=$(sed -n "$i p" < /tmp/$tlistURL)
		echo "$i:https://www.youtube.com$link"
		youtube-dl -f 22 "https://www.youtube.com$link" -o "%(upload_date)s-%(uploader)s-%(title)s.%(ext)s"
	done
else
	echo "Non e' stato selezionato nulla"
fi
rm /tmp/$tlistURL
rm /tmp/$tlistTitle
rm /tmp/$tlistTitleTime
rm /tmp/$tlistTime
rm /tmp/$tfile

