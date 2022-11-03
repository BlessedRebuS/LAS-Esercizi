#!/bin/bash

mv /var/log/nfs.log /var/log/nfs.log.last
systemctl restart rsyslog
declare -A LEN
declare -A COUNT
cat /var/log/nfs.log.last | while IFS=_ read HEAD S D L TAIL
do
[[ "$S" =~ "10.111.111." ]] && IP=”$S”
[[ "$D" =~ "10.111.111." ]] && IP=”$D”
(( LEN[$IP] += $L ))
(( COUNT[$IP] += 1 ))
done
for C in ${!LEN[$@]} ; do
[[ ${LEN[$C]} -gt 20000000 && ${COUNT[$C]} -gt 10000 ]]
&& /root/alert.sh $C
done