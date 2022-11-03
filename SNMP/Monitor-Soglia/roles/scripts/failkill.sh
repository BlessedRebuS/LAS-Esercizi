#!/bin/bash

if [ $# -ne 4 ]
then
echo Sintassi: ./failkill.sh -f FILE -s SOGLIA
exit 1
fi

FILE=$2
SOGLIA=$4

if [ ! -f "$FILE" ]; then
echo Inserire un file valido
exit 1
fi

while read host; do
res=$(./failcount.sh $host | awk -F 'STRING: ' '{print($2)}')
echo "Host: $host, fails: $res"
if [ $res -gt $SOGLIA ]; then
ssh $host sudo /usr/sbin/poweroff
fi
done < $FILE