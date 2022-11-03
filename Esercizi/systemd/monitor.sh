#!/bin/bash

while true
do
ram_usage=$(free -m | grep Mem)
#estraggo seconda riga e basta
cpu_usage=$(ps -eo user,pid,cmd,%cpu --sort=-%cpu | head -n 2 | tail -1)
echo $ram_usage
echo $cpu_usage
/usr/bin/logger local -p local1.info $ram_usage $cpu_usage
sleep 60
done
