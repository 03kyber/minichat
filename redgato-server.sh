#!/bin/bash
clear
#check folder

if [ -d "$HOME/redgato-files" ]; then

	echo "* Folder already exists, cleaning..."
	rm -r $HOME/redgato-files
	echo "* Making new folder..."
	mkdir $HOME/redgato-files
else
	echo "* Folder not existing..."
	echo "* Creating folder"
	mkdir $HOME/redgato-files
fi

#get ip

IPLIST=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*')
IP=$(echo $IPLIST | cut -d " " -f 4)

echo "Server's IP is: $IP"
echo "Listening to $1"
nc -l -p $1

