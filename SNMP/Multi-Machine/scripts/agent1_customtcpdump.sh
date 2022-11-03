#/bin/bash

SAVED="/tmp"

last=$(ls $SAVED | cut -d. -f2 | sort -n | tail -n 1)
echo LAST: $last
last=$((last +1))
new=result.$last

tcpdump -C 2 -W 1 -i eth1 -w $SAVED/$new
FILE=$SAVED/$new

CHECKSUM="$(sha256sum $FILE)"
echo CHECKSUM: $CHECKSUM

logger -n 10.1.1.254 -p local4.info "Ready:$CHECKSUM"