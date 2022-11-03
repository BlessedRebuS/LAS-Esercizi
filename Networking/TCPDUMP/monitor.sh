#/bin/bash

# ascolta sul proto udp su localhost pacchetti in uscita a localhost sulla porta 514 (syslog)
tcpdump  -c 10 -i any udp and src net 127.0.0.0/24 and dst net 127.0.0.0/24 and dst port 514

# -c max pacchetti
# -n non human readable 
# -v verbose 


# si triggera con 
# logger -n 127.0.0.1 -p local1.info "ciao"

# per generare facility 
# echo "local4.=info  /var/log/myevents.log" > /etc/rsyslog.d/mylog.conf