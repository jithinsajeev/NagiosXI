#!/bin/bash
# checking whether file is readable or not. 
file1=/etc/httpd/logs/access_log
if [[ -r "$file1" ]];
then
	echo "OK"
else
	echo "CRITICAL"
fi
