#!/bin/bash

INVENTORY=".vagrant/provisioners/ansible/inventory/routers.yml"

sed -i 's/R1-H1/10.100.100.1/g' $INVENTORY

sed -i 's/R1-R2/172.10.10.254/g' $INVENTORY
sed -i 's/R2-R1/172.10.10.1/g' $INVENTORY

sed -i 's/R2-H2/10.200.200.1/g' $INVENTORY

sed -i 's/BEGINR1/10.100.100.10/g' $INVENTORY
sed -i 's/ENDR1/10.100.100.20/g' $INVENTORY

sed -i 's/BEGINR2/10.200.200.10/g' $INVENTORY
sed -i 's/ENDR2/10.200.200.20/g' $INVENTORY

sed -i 's/NETR1/10.100.100.0/g' $INVENTORY
sed -i 's/NETR2/10.200.200.0/g' $INVENTORY
