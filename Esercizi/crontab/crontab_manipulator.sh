#/bin/sh

PERIODO='*/10 8-18 * * *'
COMANDO='/home/las/qualcosa.sh parametri vari'
TMPTAB=$(mktemp)
crontab -l | grep -vF "$COMANDO" > $TMPTAB 
echo "$PERIODO $COMANDO" >> $TMPTAB
crontab $TMPTAB
rm $TMPTAB
