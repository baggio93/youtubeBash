#!/bin/bash
SOURCE="$(dirname $(readlink -f $0))"
while true; do
	nl -nrz -w2 $SOURCE/canali.conf | cut -d'=' -f1
	read -p "Seleziona il canale: " chan
	if [ "$chan" == "" ]; then
		break
	fi
	link=$(sed -n "$chan p" < $SOURCE/canali.conf | cut -d'=' -f2)
	echo "1)Vedere il video del canale"
	echo "2)Scaricare video del canale"
	read mod
	if [ $mod -eq "1" ]; then
		$SOURCE/youtubeView.sh $link
	elif [ $mod -eq "2" ]; then
		$SOURCE/youtubeDownload.sh $link
	fi
done

