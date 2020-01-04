#/bin/bash

youtube-dl -i :ytsubs --netrc --no-check-certificate --playlist-end 20 -f 22,36 --no-post-overwrites -o "/media/disk2/youtube/%(title)s-%(upload_date)s.%(ext)s"
find /media/disk2/youtube/* -mtime +7 -delete
