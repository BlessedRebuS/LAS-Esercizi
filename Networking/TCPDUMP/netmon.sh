#!/bin/bash

# Monitorare con tcpdump il traffico ssh tra la VM Client e la VM Server, sulla VM Router, loggando attraverso syslog sul file /var/log/newconn l'inizio e la fine di ogni  connessione diretta da Client a Server

tcpdump -i any -nlp src net 10.1.1.0/24 and dst net 10.2.2.0/24 and dst port 22 and 'tcp[tcpflags] & tcp-syn != 0' | while read TIME INT DIR PROTO SRC ARROW DST RESTO ; do
#echo Connessione stabilita $IP | logger -p local1.info
echo $TIME $INT $DIR $PROTO $SRC $ARROW $DST $RESTO
done 