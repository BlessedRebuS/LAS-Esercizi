#!/bin/bash

#Se ci sono più di 20 utenti nel file active.users li scrive nel file bad.users
if [ $# -ne 1 ]
then
echo Sintassi: ./alert.sh IP
exit 1
fi

snmpget -Oqv -v 1 -c public $1 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"firstcommand\" >> /home/vagrant/active.users

sort active.users | uniq -c | tr -s '\n' | while read COUNT USER; do
echo $COUNT $USER
if [ $COUNT -gt 20 ]; then
echo $USER >>  bad.users
fi
done 