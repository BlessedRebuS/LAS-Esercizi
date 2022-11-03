#!/bin/bash

cmd=$(snmpget -v 1 -c public 10.10.10.254 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"firstcommand\" | awk -F 'STRING: ' '{print($2)}')

splitted1=$(echo $cmd | cut -d' ' -f1)
splitted2=$(echo $cmd | cut -d' ' -f2)

if [ $splitted2 == "new" ]; then
echo "provo ./ldap.sh new"
fi

if [ $splitted1 == $HOSTNAME ]; then
configurator=$(ip a | grep 10.20.20.20)
echo config: $configurator
sudo ip addr add 10.20.20.20/24 dev eth2
echo UGUALE
else
sudo ip addr del 10.20.20.20/24 dev eth2
fi