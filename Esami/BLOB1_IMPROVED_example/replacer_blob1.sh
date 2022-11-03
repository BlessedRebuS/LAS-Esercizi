#!/bin/bash

INVENTORY=".vagrant/provisioners/ansible/inventory/routers.yml"

sed -i 's/R1-H1/192.168.10.1/g' $INVENTORY
sed -i 's/R1-H2/192.168.20.1/g' $INVENTORY

sed -i 's/BEGINR1/192.168.10.10/g' $INVENTORY
sed -i 's/ENDR1/192.168.10.20/g' $INVENTORY

sed -i 's/BEGINR2/192.168.20.10/g' $INVENTORY
sed -i 's/ENDR2/192.168.20.20/g' $INVENTORY

sed -i 's/NETR1/192.168.10.0/g' $INVENTORY
sed -i 's/NETR2/192.168.20.0/g' $INVENTORY
