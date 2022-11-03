#UCD-SNMP-MIB::prCount.1 = INTEGER: 4
#UCD-SNMP-MIB::prErrMessage.1 = STRING: Too many sleep running (# = 4)

#/bin/bash
tmp1=$(mktemp)
tmp2=$(mktemp)
snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.2 > $tmp1
grep "UCD-SNMP-MIB::prNames.*" $tmp1 > $tmp2

res=$(grep $1 $tmp2)
echo $res
num=$(echo $res | cut -d. -f2 | cut -d= -f1)
grep "UCD-SNMP-MIB::prErrMessage.$num*" $tmp1 