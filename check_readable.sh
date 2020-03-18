#!/bin/bash
# checking whether file is readable or not. 
file1=/etc/httpd/logs/access_log
if [[ -r "$file1" ]];
then
	echo "/etc/httpd/logs/access_log is readable"
else
	echo "/etc/httpd/logs/access_log is not readable"
fi

# Create file2.txt in /tmp for test. 
file2=/tmp/file2.txt
if [[ "$file2" ]];
then
	echo "/tmp/file2.txt is readable"
else
	echo "/tmp/file2.txt is readable is not readable"
fi
