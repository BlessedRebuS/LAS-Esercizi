#/bin/bash

if [ $(uptime | cut -d: -f5 | cut -d, -f2) -lt $1 ]
then 
	wall "DONE"
else	
	echo "Carico eccessivo"
	echo "./test1.sh $1" | at now + 1 minutes
fi

