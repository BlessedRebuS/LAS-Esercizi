#/bin/bash

if [ "$#" -lt 6 ]; then
	echo "Error, usage: niceexec.sh -n MAX_TENTATIVI -s SOGLIA_CARICO  COMANDO_DA_ESEGUIRE  PARAMETRI"
	exit 1
fi

if [ -z $7 ] 
then
n=$2
echo "Schedule avvenuta"
else
n=`expr $7 - 1`
echo "Tentativo numero $n"
if [ $n -lt 1 ]; then echo "Max tentativi raggiunti"; exit 1; fi
fi


echo "Max tentativi: $2"
echo "Soglia: $4"
echo "Comando: $5"
echo "Parametri: $6"

load=$(uptime | cut -d: -f5 | cut -d, -f2 | cut -d. -f1)
echo "Load --> $load"

if [ $load -lt $4 ]
then 
	wall "DONE"
	$5
else
	echo "Carico eccessivo"
	echo "$0 $1 $2 $3 $4 $5 $6 $n" | at now + 1 minutes
fi

