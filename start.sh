#!/bin/bash

clear

echo ""
echo  "███████╗ █████╗ ██╗   ██╗██╗   ██╗███████╗ ██████╗  █████╗ ██████╗ ██████╗ ███████╗"
echo  "██╔════╝██╔══██╗██║   ██║██║   ██║██╔════╝██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔════╝"
echo  "███████╗███████║██║   ██║██║   ██║█████╗  ██║  ███╗███████║██████╔╝██║  ██║█████╗  "
echo  "╚════██║██╔══██║██║   ██║╚██╗ ██╔╝██╔══╝  ██║   ██║██╔══██║██╔══██╗██║  ██║██╔══╝  "
echo  "███████║██║  ██║╚██████╔╝ ╚████╔╝ ███████╗╚██████╔╝██║  ██║██║  ██║██████╔╝███████╗"
echo  "╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝" 
echo ""
echo "Action à réaliser :"
echo ""
echo "1 - Installation packages"
echo "2 - Faire une backup"
echo "3 - Extraire une backup"
echo "4 - Supprimer les backups"
echo "5 - Aide"
echo "6 - Supprimer les backups"
echo "7 - Sortir"

read choix


if [ $choix = 1 ]
	then
	#Installation packages
	./script/packages.sh
elif [ $choix = 2 ]
	then
		./script/save.sh
elif [ $choix = 3 ]
	then
	#Extraction
		./script/extract.sh
elif [ $choix = 4 ]
	then
	#Supprimer les backups
		./script/delete.sh
elif [ $choix = 5 ]
	then
	#Affiche l'aide
	echo "Aide :"
	echo "Avant d'utiliser l'utilitaire de backup, il est indispensable d'installer les packages sur votre serveur et sur votre client"
	echo "- L'action numéro 1 permet d'installer et d'initialiser un serveur NFS et un client capable de communiquer avec celui-ci."
	echo "- L'action numéro 2 permet de faire des backups envoyées automatiquement sur le serveur NFS."
	echo "- L'action numéro 3 permet d'extraire une backup enregistrée où vous le souhaitez."
	echo "- L'action numéro 4 permet de supprimer toutes les backups."
	echo "- L'action numéro 5 affiche l'aide que vous lisez en ce moment"
elif [ $choix = 6 ]
	then
	#Supprimer les backups
		./script/crontab.sh
elif [ $choix = 7 ]
	then
	#Sort du script
	clear
	exit 1
else
	./start.sh

fi
