#/bin/bash

if [ -d $1 ] 
then
path=$1
shift
 for i in $@
     do	     echo "Estensione: $i"
	     ls $path | grep -wc $i
     done	
else
 echo "Inserisci una directory valida"
fi
