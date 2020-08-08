#!/bin/bash

clear

echo "Quelle installation souhaitez-vous réaliser ?"
echo ""
echo "1 - Serveur NFS"
echo "2 - Client NFS"
read choix

if [ $choix = 1 ]
	then
		./script/nfs-server-install.sh
elif [ $choix = 2 ]
	then
		./script/nfs-client-install.sh
else
	../start.sh
fi
