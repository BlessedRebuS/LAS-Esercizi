#/bin/bash


logfile="/var/log/my.log"
script_path="/home/rebus/LAS/logrotate.sh"

if [ ! -z $(tty)  ]

then
echo "Comando lanciato da $(tty)"
echo "local4.=warn  /var/log/$logfile" > /etc/rsyslog.d/mylog.conf

PERIODO='00 23 * * *'
COMANDO="$script_path"
TMPTAB=$(mktemp)

# dump della tabella e rimozione di eventuale riga che già contenga COMANDO, per evitare duplicati
crontab -l | grep -vF "$COMANDO" > $TMPTAB
echo "$PERIODO $COMANDO" >> $TMPTAB
crontab $TMPTAB
rm $TMPTAB

else
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
fi


