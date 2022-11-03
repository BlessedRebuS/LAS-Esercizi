#!/bin/bash

# se nel servizio specifico tipo simple con restart=always, anche se viene terminato il processo con sigkill, il processo viene rilanciato.

# create tmp directory
tmp=$(mktemp -d)
echo "Dir temporanea: $tmp"

function backup(){

# print line by line save.list
while read line
do
echo "copio $line in $tmp"
cp $line $tmp
done < /home/vagrant/save.list

# manage tar file
timestamp=$(date --iso-8601)
name="bck.timestamp_$timestamp.tgz"
tar -czf $name $tmp
}

while true
do
backup
sleep 14400
done