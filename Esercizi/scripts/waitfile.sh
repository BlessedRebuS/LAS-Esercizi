#/bin/bash

fun(){
echo $1 $2 $3
if [ -e $1 ] && [ -e $2 ]
then
CMD=$1	
echo "Comando: $CMD"
if [[ "$CMD" == *"ls"* ]] || [[ $CMD == *"rm"* ]] || [[ $CMD == *"touch"* ]]; then echo "OK"; else echo "Errore, inserisci comando ls, rm o touch"; fi
case $3 in
  
  # exec now
  force)
  $1 $2
  ;;
  # N times
  [0-9])
  for i in {1..$3}
  	  do 
	  if [ ! -z "$2" ]; then break; fi
	  sleep 1
  	  done
  ;;
  # default 10
  *)
  for i in {1..10}
  	  do
          if [ ! -z "$2" ]; then break; fi
	  sleep 1;
  	  done
  ;; 

esac
else echo "Errore inserimento parametri"
fi


}

fun $1 $2 $3
