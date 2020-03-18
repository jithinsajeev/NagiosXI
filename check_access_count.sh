#!/bin/bash

#This script is checking /etc/httpd/logs/access_log access count and printing following;

echo "Less than 10 access is OK!"
echo "More than 10 access is WARNING!!"
echo "More than 50 access is CRITICAL!!!" 

count=`cat /etc/httpd/logs/access_log | awk '{print $1}' | uniq -c | sort -n | tail -1 | awk '{print $1}'`

if [[ "$count" -gt "50" ]];
then
	echo "CRITICAL"
else
	if [[ "$count" -lt "10" ]];
	then
        	echo "OK"
	else
		echo "WARNING"
	fi
fi
