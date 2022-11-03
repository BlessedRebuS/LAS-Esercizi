#!/bin/bash

while sleep 14400 ; do
	DATE=$(/usr/bin/date +%s)
	/usr/bin/tar -czvf /home/johnd/bck."$DATE".tar.gz --files-from=/home/johnd/save.list
done
