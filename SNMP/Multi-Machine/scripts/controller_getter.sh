#/bin/bash

### per rendere lo script estendibile a due agent si deve gestire in piu' solamente il logger
### ovvero distinguere il caso in cui su rsyslog le notifiche arrivino da due ip diversi

# per semplificare leggo solo ultima riga

SAVED_PCAPS=/home/vagrant/pcaps
res=$(tail -n 1 /var/log/myevents.log)
last_logger=$(echo $res | cut -d. -f2)
echo "Ultimo log da agent: $last_logger"

# prendo ultimo numero dell' ultimo pcaps aggiunto

if [ ! -z  "$(ls $SAVED_PCAPS)" ]; then

last=$(ls $SAVED_PCAPS | cut -d. -f2 | sort -n | tail -n 1=
last=$((last + 1))
new=result.$last

scp  -i /home/vagrant/.ssh/id_rsa vagrant@10.1.1.53:/tmp/result.$last_logger $SAVED_PCAPS/$new
logger -n 10.1.1.53 -p local4.info $last_logger

else
scp  -i /home/vagrant/.ssh/id_rsa vagrant@10.1.1.53:/tmp/result $SAVED_PCAPS/result.1
logger -n 10.1.1.53 -p local4.info result.1
fi

snmpget -v 1 -c public 10.1.1.53 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"secondcommand\"

### per essere sicuro che i file siano diversi dovrei confrontare tutti i checksum, ma usando tcpdump -W (numero) posso gia' essere sicuro che i pcaps siano incrementali
### su crontab per lanciare le query snmp uso
###  */3 * * * * snmpget -v 1 -c public 10.1.1.53 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"firstcommand\"
