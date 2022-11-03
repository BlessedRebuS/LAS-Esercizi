#!/bin/bash

logfile="/var/log/my.log"
dir="/var/log"

#devo fare un ciclo al contrario sennò sovrascrivo il file con mv
n=$(ls $dir/my.log* | cut -d. -f3 | sort -r)

for file in $n
do
	res=`expr $file + 1`
	echo $res
	old="$logfile.$file.bz2"
       	new="$logfile.$res.bz2"
	echo "OLD: $old, NEW: $new"
	mv $old $new
done

#carico il nuovo file di log
new_logfile=$(ls $logfile | cut -d/ -f4)
echo $new_logfile
mv $logfile $dir/$new_logfile.1

#reload processo che scrive su syslog
/usr/bin/bzip2 $dir/$new_logfile.1
/usr/bin/fuser -k -HUP /usr/sbin/rsyslogd
