#/bin/sh

COMMAND=$(echo $1 | cut -d. -f1)
echo $COMMAND

if [ -e $2 ]
then
	echo "Selezionato $1 $2"
	# do stuff . . .
else
	echo "Sintassi: facility.priority nomefile"
fi

