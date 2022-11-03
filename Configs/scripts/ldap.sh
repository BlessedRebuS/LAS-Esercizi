#!/bin/bash

IP=10.100.0.1
DIR=/tmp/dir.backup

if [ $# -eq 0 ]; then
ldapsearch -x -D "cn=admin,dc=labammsis" -w "gennaio.marzo" -H ldap://10.0.2.15/ -b "dc=labammsis" -s sub > dump.ldif
scp dump.ldif $IP:$DIR

elif [ $1 == "new" ]; then
scp -i /home/vagrant/.ssh/id_rsa $IP:$DIR ./entries.ldif
ldapsearch -x -LLL -D cn=admin,dc=labammsis -b ou=People,dc=labammsis -s one -w gennaio.marzo -H ldapi:/// | grep dn: | ldapdelete -x -D cn=admin,dc=labammsis -w gennaio.marzo -H ldapi:///
ldapadd -x -D cn=admin,dc=labammsis -w gennaio.marzo -f entries.ldif
else
logger -n $IP -p local1.info "parametri: $@"
fi
