#!/bin/bash
if [ ! -d ./notes ]; then
	echo "directory notes doesn't exist, creating one..."
	mkdir ./notes
	if [ $? ]; then 
		echo "notes successfully created..." 
	else
		echo "error in creating directory notes..."
	fi
else
	echo "directory notes exists, skipping this step..."
fi
install=$(dpkg --status openssh-server | grep Status)
if [[ $install == 'Status: install ok installed' ]]; then
	echo "openssh-server is installed..."
	serv=$(systemctl status ssh | grep Active: | awk '{print $2;}')
	if [ $serv == 'active' ];then
		echo "service is active..."
	elif [ $serv == 'inactive' ];then
		echo "service is inactive, start it to bashnote to work..."
	else
		echo "error in knowing the service status..."
	fi
else
	echo "openssh-server is not installed...install it and try again..."
fi