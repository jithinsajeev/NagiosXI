#!/bin/bash
#Checks database size in mysql
mysql --execute="SELECT table_schema 'Database Name',  SUM(data_length + index_length) 'Size in Bytes', ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) 'Size in MiB' FROM information_schema.tables WHERE table_schema = 'jithin'" > /tmp/new1.txt

DBSIZE=`sed -n 2p /tmp/new1.txt | cut -f 2`

if [[ "$DBSIZE" -gt "50000" ]] ; then
	echo "CRITICAL"
else
	echo "OK"
fi
exit 0
