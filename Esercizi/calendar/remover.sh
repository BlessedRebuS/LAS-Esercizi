#!/bin/bash

NOW=$(date "+%Y-%m-%d %H:%M")

#in secondi
alert=154800

echo "$NOW"

while read -r line;
do
tmp=$(echo "$line" | cut -d' ' -f1-2) ;
echo $tmp
diff="$(($(date -d "$NOW" '+%s') - $(date -d "$tmp" '+%s')))"
echo $diff
res=`expr $diff - $alert`
echo "Risultato: $res"
if [ $res -gt 0 ]
then
echo "Promemoria $line da rimuovere"
sed -i "s/$line//g" promemoria
echo DIFF: $res
fi
done < promemoria
