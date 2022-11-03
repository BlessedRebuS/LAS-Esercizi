#!/bin/bash

M=100

# se non metto le parentesi la subshell si "dimentica" il valore di M
cat servers | ( while read IP LOAD; do
echo IP:$IP LOAD:$LOAD
if [ $LOAD -lt $M ]; then
echo "OK"
M="$LOAD"
BESTSERVER=$IP
fi
done

echo Il miglior server è $BESTSERVER con load $M )
