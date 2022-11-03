#/bin/bash

# Esattamente un parametro
if [ $# -ne 1 ]
then
echo Sintassi: ./failcount.sh IP
exit 1
fi


# Controllo se file esiste
if [ ! -f "$FILE" ]; then
echo Inserire un file valido
exit 1
fi

#Controll se il primo parametro è new
if [ $1 == "new" ]; then
echo OK
fi