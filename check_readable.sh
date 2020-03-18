#!/bin/bash
# checking whether file is readable or not. 
file=/etc/httpd/logs/access_log
if [[ -r "$file" ]];
then
	echo "File is readable"
else
	echo "File is not readable"
fi
