#!/bin/bash

mysql --execute="SELECT 
    table_schema 'Database Name',
    SUM(data_length + index_length) 'Size in Bytes',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) 'Size in MiB'
FROM information_schema.tables 
WHERE table_schema = 'jithin'" > /tmp/new1.txt

sed -n 2p /tmp/new1.txt > /tmp/new.txt

cat /tmp/new.txt | cut -f 2 > /tmp/new1.txt

rm -rf /tmp/new.txt

a=`cat /tmp/new1.txt`

if [ $a -gt 50000 ]
then
	echo "CRITICAL"
else
	echo "OK"
fi
