#/bin/bash
clear
#split IP and PORT.
IP=$(echo "$1" | cut -d ":" -f 1)
PORT=$(echo "$1" | cut -d ":" -f 2)

echo "Verifying connection..."

if ping -c 1 $IP >/dev/null 2>&1; then

	echo "* Connection available"
else
	echo "[ERROR] IP is not available or doesn't exist."
	exit 1
fi

echo "$IP and $PORT"

read -p "* Do you want to send any test file? (Y/N) " yn

if [ $yn == "Y" ]; then

	read -p "* Which file do you want to send? (Make sure its on $HOME/redgato-torrent)" whatfile
	if [ -f $HOME/redgato-torrent/$whatfile ]; then
		echo "Sending $whatfile"
		cat $HOME/redgato-torrent/$whatfile | nc $IP $PORT
	else
		echo "[ERROR] File not found. Make sure its written properly or in $HOME/redgato-torrent"
	fi

elif [ $yn == "N" ]; then

	echo "Understood."
fi

