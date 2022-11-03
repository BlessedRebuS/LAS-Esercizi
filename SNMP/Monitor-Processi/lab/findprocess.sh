#/bin/bash

# da mettere in /usr/bin/findprocess.sh
ps aux | cut -d\. -f1 | awk ' {print $2}'
