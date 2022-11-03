#!/bin/bash

INVENTORY=".vagrant/provisioners/ansible/inventory/routers.yml"

sed -i 's/R1-H1/XXXXX/g' $INVENTORY
sed -i 's/R1-H2/XXXXX/g' $INVENTORY

sed -i 's/R1-R2/XXXXX/g' $INVENTORY

sed -i 's/R2-H1/XXXXX/g' $INVENTORY
sed -i 's/R2-H2/XXXXX/g' $INVENTORY

sed -i 's/BEGINR1/XXXXX/g' $INVENTORY
sed -i 's/ENDR1/XXXXX/g' $INVENTORY

sed -i 's/BEGINR2/XXXXX/g' $INVENTORY
sed -i 's/ENDR2/XXXXX/g' $INVENTORY

sed -i 's/NETR1/XXXXX/g' $INVENTORY
sed -i 's/NETR2/XXXXX/g' $INVENTORY
