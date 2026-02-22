#!/bin/bash

read -p "Enter the service name to check the status: " service
read -p "Do you want to check the status?(y/n): " choice

if [ "$choice" = "y" ];then
	if systemctl status "$service" > /dev/null 2>&1; then
		echo "$service is active"
	else
		echo "$service is not active"
	fi
elif [ "$choice" = "n" ];then
	echo "Skipped."

else
	echo "Invlaid Input."
fi

