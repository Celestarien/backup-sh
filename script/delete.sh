#!/bin/bash

clear
echo "Êtes-vous sur de vouloir supprimer les backups ?"
echo ""
echo "1 - Oui"
echo "2 - Non, retourner au menu"
read choix

if [ $choix = 1 ]
	then
		borg delete /mnt/sharedfolder_client
		clear
		echo "Toutes les backups ont été supprimés avec succès !"
elif [ $choix = 2 ]
	then
		#Retour menu
		../start.sh
else
	../start.sh
fi
