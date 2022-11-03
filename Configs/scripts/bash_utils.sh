#/bin/bash

# Ciclo sul file
while read line; do
echo $line
done < $FILE

# Ciclare il file memorizzando first second third
cat /var/log/mylog | while read FIRST SECOND THIRD; do
echo $FIRST $SECOND $THIRD
done


#read parameters with subshell
snmpget -v 1 -c public 10.10.10.254 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"firstcommand\" |
awk -F 'STRING: ' '{ print $2 }' | (
read NAME PARAM
echo $NAME $PARAM
)



### ARRAY ###
# Dichiara array
declare -A LEN
# Per inserire valori nell' array
(( LEN[1] += 5 )) 
(( LEN[2] += 1 ))
# Per stampare
echo ${LEN[1]}
echo ${LEN[2]}

#ciclare sull' array
for C in ${!LEN[$@]} ; do
[[ ${LEN[$C]} -gt 1 ]]  && echo "OK!"
done
