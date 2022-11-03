#!/bin/bash

report () {
	echo $(date) osservate $TOT righe
	TOT=0
}

# poiche' alla terminazione del processo tra () termina anche tail
# (dovuto a SIGPIPE), per far ripartire il tutto riaprendo il file
# basta metterlo dentro un ciclo infinito
while true ; do

  # attendo che il file compaia
  if test -f "$1" ; then
    tail -n +0 -f "$1" | (
      # se definissi la trap nel main dello script, non funzionerebbe
      # perché la pipeline genera processi figli che non ereditano
      # i signal handler.
      # genero un processo che abbia il proprio signal handler
      # lo rendo facilmente rintracciabile salvando il pid su file
      echo $BASHPID > /tmp/logwatch.pid
      echo $BASHPID
      TOT=0
      trap report USR1
      while read R ; do
	TOT=$(( $TOT + 1 ))
      done
    )    	
  else 
    sleep 1
  fi
done


