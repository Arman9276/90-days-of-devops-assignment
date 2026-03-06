#!/bin/bash

#Ensure the script run as root
if [ "$EUID"-ne 0 ]; then
	echo "Please run as root or use sudo"
	exit 1
fi

#1.Define the list of packages
PACKAGES=("nginx" "curl" "wget")
echo "Start Package Check..."
echo "----------------------"

#2.Loop through the array
for PKG in "${PACKAGES[@]}"
do
	#3.Check pacakage is install or not
	#dpkg -s return 0 if package is install else return 1 if not
	if dpkg -s "$PKG">/dev/null 2&1; then
		echo "$PKG is already installed"
	else
		echo "$PKG is not installed.So now $PKG is installing..."
		apt-get update -y>/dev/null 2>&1
		apt-get install -y "$PKG"

		if [ $? -eq 0 ]; then
			echo "$PKG installed successfully"
		else
			echo "$PKG failed to install"
		fi
	fi
done

echo "-----------"
echo "Status check complete !"


