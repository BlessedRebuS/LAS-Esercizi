#!/bin/bash

#copio la configurazione ssh di vagrant dentro quella della macchina host
vagrant ssh-config >> ~/.ssh/config

DIR="consegna"
PATH_VM="/home/vagrant"
declare -a arr=("client1" "client2" "router")

for i in "${arr[@]}"
do
   echo "Consegno: $i"
   mkdir -p $DIR/$i
   scp -rp vagrant@$i:"$PATH_VM/* $PATH_VM/.bash_history" $DIR/$i   
   
done

tar czf ammsis.tar.gz $DIR
