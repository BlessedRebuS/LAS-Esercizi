ls -R -p | grep -v -e "/" -e ":" | rev | cut -d. -f1 | rev | sort | uniq -c
