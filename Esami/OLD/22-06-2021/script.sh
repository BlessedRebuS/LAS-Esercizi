#!/bin/bash

declare -A TRAFFICO

# ascolta il traffico di rete e memorizza byte riceuti da ogni Ip sorgente
cat file | while IFS=" "  read IP SIZE ; do
echo IP: $IP SIZE: $SIZE
(( TRAFFICO[$IP] += $SIZE ))
for k in "${!TRAFFICO[@]}"
do
    echo "$k -> ${TRAFFICO[$k]}"
if [ ${TRAFFICO[$k]} -gt 1000 ]; then
echo "LIMITE!"
fi
done
done

