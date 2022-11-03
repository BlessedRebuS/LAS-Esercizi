PERIODO='*/10 8-18 * * *'
COMANDO='/bin/ls'
TMPTAB=$(mktemp)
# dump della tabella e rimozione di eventuale riga che già contenga COMANDO, per evitare duplicati
crontab -l | grep -vF "$COMANDO" > $TMPTAB 
echo "$PERIODO $COMANDO" >> $TMPTAB
crontab $TMPTAB
rm $TMPTAB
