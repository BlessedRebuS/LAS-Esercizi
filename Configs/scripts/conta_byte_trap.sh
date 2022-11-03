#!/bin/bash

CBPID="/tmp/contabyte.pid"
declare -A TRAFFICO

function stampa() {
    for i in "${!TRAFFICO[@]}" ; do echo "$i: ${TRAFFICO[$i]}" ; done
}

function azzera() {
    for i in "${!TRAFFICO[@]}" ; do unset TRAFFICO[$i] ; done
}

# esempio di formato dell'output di tcpdump -nl
# 13:24:21.315253 lo    In  IP 127.0.0.1.46612 > 127.0.0.1.514: SYSLOG local1.info, length: 126

tcpdump -nl -i any | ( 

  echo $BASHPID > $CBPID
  echo "Manda i tuoi segnali al processo $BASHPID (se perdi questo numero, è nel file $CBPID)"

  trap stampa USR1 
  trap azzera USR2

  while read TIME INT DIR PROTO SRC ARROW DST RESTO ; do
    SIZE=$(echo $RESTO | awk -F 'length: ' '{ print $2 }' | cut -f1 -d' ')
    SIP=$(echo $SRC | cut -f1-4 -d.)
    if test "${TRAFFICO[$SIP]}" ; then
        TRAFFICO[$SIP]=$(( ${TRAFFICO[$SIP]} + $SIZE ))
    else
        TRAFFICO[$SIP]=$SIZE
    fi
  done
)