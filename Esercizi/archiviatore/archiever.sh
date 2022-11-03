#!/bin/bash

try (){
if [[ -n $1 ]]
then
for file in $1
do
cp $file $tmpdir
done
tar -czvf $archive_name $tmpdir
exit 0
fi
}

d=$(date "+%Y%m%d_%H%M")
archive_name="backup_$d.tar.gz"
tmpdir=$(mktemp -d)

if [ ! -d $1 ]
then
	echo "La directory non esiste"
exit 1
fi

first=""
second=""
first=$(find test -type f -mtime -7)
second=$(find test -type f -not -user root -perm /7000)
third=$(find test -name "*DOC*" -size +1c -exec file {} ";" | grep text | cut -d: -f1)

try "$first"
try "$second"
try "$third"

