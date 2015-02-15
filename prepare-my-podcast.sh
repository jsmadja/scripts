#!/bin/bash
cd /youtube

mkdir /tmp/prepare-my-podcast

echo "cleaning files ..."
rm -rf /tmp/prepare-my-podcast/*
find . -type f -mtime +2 -name "*.mp4" -exec rm -f {} \;
find . -type f -mtime +2 -name "*.mp3" -exec rm -f {} \;

echo "downloading youtube videos"
for i in $(curl http://gdata.youtube.com/feeds/base/users/anzymus/newsubscriptionvideos |grep -P '(?<=href=").*?(?=")' -o | uniq | grep watch)
do
	logfile=$(echo "$i" | cut -d'/' -f4 | cut -d'&' -f1)
	/usr/local/bin/youtube-dl $i -f 18 -o "$(date +%U)_%(title)s.%(ext)s" --restrict-filenames > /tmp/prepare-my-podcast/$logfile.log &
done

#echo "dowloading dailymotion videos"
#for i in $(curl -s https://api.dailymotion.com/user/x3877b/videos?fields=url | grep -Po '(?<="url":")[^"]*')
#do
#	filename=$(echo $i | cut -d'/' -f5)
#        movgrab http://www.dailymotion.com/video/$filename -o $filename.mp4 > /tmp/prepare-my-podcast/$filename.log &
#done

echo "downloading podcast files"
podget > /tmp/prepare-my-podcast/podget.log
rm -rf *.m3u
