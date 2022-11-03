#/bin/bash

if [ $# -ne 1 ]
then
echo Sintassi: ./failcount.sh IP
exit
fi

echo Cercp host $1
snmpget -v 1 -c public $1 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"logreader\"