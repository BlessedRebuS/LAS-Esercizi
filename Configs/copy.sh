#!/bin/bash

#copio la configurazione ssh di vagrant dentro quella della macchina host
vagrant ssh-config > ~/.ssh/config

DIR="consegna"
PATH_VM="/home/vagrant"
INTEFACES="/etc/network/interfaces"
INTEFACESD="/etc/network/interfaces.d/*"


declare -a arr=("client" "server" "router1" "router2")

for i in "${arr[@]}"
do
   echo "Consegno: $i"
   mkdir -p $DIR/$i
   scp -rp vagrant@$i:"$PATH_VM/* $PATH_VM/.bash_history $INTEFACES $INTEFACESD" $DIR/$i   
done
tar czf ammsis.tar.gz $DIR
