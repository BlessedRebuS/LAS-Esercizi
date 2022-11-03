#!/bin/bash

PORT=514
SYSLOG_IP=192.168.56.101

#registra qualunque traffico rsyslog e lo scrive su router1
tcpdump -i eth1 -nlp dst net 10.222.222.0/24 and dst port $PORT or src net 10.222.222.0/24 and dst port $PORT | while read TIME P SRC V DST RESTO ; do
#echo Connessione stabilita $IP $DST $INT 

SIP=$(echo $SRC | cut -d. -f1-4)
DIP=$(echo $DST | cut -d. -f1-4)
LEN=$(echo $RESTO | awk -F 'length' '{print $2}')

echo SOURCE IP: $SIP DEST IP $DIP LEN $LEN | logger -n $SYSLOG_IP -p local1.info

#echo $TIME $INT $DIR $PROTO $SRC $ARROW $DST $RESTO
done