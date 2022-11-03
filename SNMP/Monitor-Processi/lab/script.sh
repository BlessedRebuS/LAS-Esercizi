#/bin/bash

# usage: script.sh ip1 ip2
echo Inserisci IP

for i in $@
do
echo IP: $i processi attivi: $(sudo snmpget -v 1 -c public $i  NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"process\" | cut -d: -f4)
done