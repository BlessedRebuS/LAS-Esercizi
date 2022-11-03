#!/bin/bash

declare -A TRAFFICO
# ascolta il traffico di rete e memorizza byte riceuti da ogni Ip sorgente
tcpdump  -c 10 -nl -i any udp and dst net 127.0.0/24 and dst port 514 | while read TIME INT DIR PROTO SRC ARROW DST RESTO ; do
SRC_IP=$(echo $SRC | cut -d. -f1-4) # i primi 4 campi separati da punto sono IP SORGENTE
SIZE=$(echo $RESTO | awk -F 'length: ' '{print $2}')
echo IP: $SRC_IP SIZE PACCHETTO: $SIZE
TRAFFICO[$SRC_IP]=$(( ${TRAFFICO[$SRC_IP]} + $SIZE ))
for k in "${!TRAFFICO[@]}"
do
    echo "$k -> ${TRAFFICO[$k]}"
done
done



# -l fa la line pipe read, sennò tcpdump utilizza una cache