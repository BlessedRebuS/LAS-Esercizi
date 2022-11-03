#/bin/bash

function terminate(){
kill -9 ${!PID[@]}
}
tmp=$(mktemp)
logfile="file.log"
echo "File temporaneo --> $tmp"

for i in $@
do
	$i & PID[$!]="$i"
	echo "$i $!" > $tmp
done

echo ${!PID[@]} >> $logfile 
echo ${PID[@]} >> $logfile
trap terminate SIGKILL
echo "-------"
cat $tmp 
echo "-------"

while true
do
while read line
do
p=$(cat $tmp | cut -d' ' -f1)
sleep 1
sed -i /$p/d $tmp
if [ ! -d "/proc/$p" ]; then echo "Processo terminato: $p"; fi
done < $tmp
sleep 1
if [ ! -s $tmp ]; then
echo "Fine"
exit 1
fi
done

