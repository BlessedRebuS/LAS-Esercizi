#!/bin/bash

archive_name="arch.tar"

if [ ! -d $1 ]
then
	echo "La directory non esiste"
exit 1
fi

first=$(find test -type f -mtime -7)
second=$(find test -type f -not -user root -perm /7000)
third=$(find test -name "*DOC*" -size +1c -exec file {} ";" | grep text | cut -d: -f1)

if [[ -n $first ]]
then
echo "first step"
for file in $first
do
f+=$file' '
done
echo $f
tar -cvf $archive_name $f
exit 0
fi
