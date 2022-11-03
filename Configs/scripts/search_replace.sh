#/bin/bash


res=$(sudo ldapsearch -x -b "dc=labammsis" -H ldap://10.0.2.15/ "(&(objectClass=*)(homeDirectory="/home/dave"))" | grep dn | cut -d: -f2)

echo RESULT: $res

for value in $res; do
name=$(echo $value | cut -d, -f1 | cut -d= -f2)
echo NAME:$name
echo -e "dn:$value\nchangetype: modify\nreplace: gecos\ngecos: test" > $name.ldif
ldapmodify -x -D "cn=admin,dc=labammsis" -w "gennaio.marzo" -H ldap:/// -f $name.ldif
done