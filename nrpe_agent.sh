#!/bin/bash
#Installs nagios xi nrpe agent automatically.

if [[ "$#" -lt "1" ]] ; then 
  echo "Server IP should be provided as argument"
  exit 1
fi

#check if wget exists, and attempt to install.
if `which wget > /dev/null` ; then
  echo "wget found. continue."
else
  #install wget for centos/redhat
  if [[ `which yum > /dev/null` ]] ; then
    yum -y install wget    
  fi
  #install wget for ubuntu/debian
  if [[ `which apt-get > /dev/null` ]] ; then
    apt-get -y install wget    
  fi
fi


cd /tmp 
curl -O https://assets.nagios.com/downloads/nagiosxi/agents/linux-nrpe-agent.tar.gz 

if [[ "$?" -ne "0" ]] ; then
  echo "Downloding client failed."
  exit 1
fi

tar xzf linux-nrpe-agent.tar.gz && cd linux-nrpe-agent && ./fullinstall -n -i $1
