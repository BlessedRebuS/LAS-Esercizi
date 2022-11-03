#/bin/bash

remove=$(tail -n 1 /var/log/myevents.log | awk '{print $6}')

echo "Rimuovo: $remove"

rm /tmp/result.$remove