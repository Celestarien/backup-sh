#!/bin/bash

echo ""
echo "####################"
echo "Installation de sudo"
echo "####################"
echo ""
apt-get install sudo -y

echo ""
echo "##########################"
echo "Mise à jour des dépots APT"
echo "##########################"
echo ""
sudo apt-get update -y

echo ""
echo "###############################################"
echo "Installation du fichier de prise en charge NFS"
echo "###############################################"
echo ""
sudo apt-get install nfs-common -y

echo ""
echo "###############################################"
echo "Installation de Borg"
echo "###############################################"
echo ""
sudo apt install borgbackup -y

echo ""
echo "######################################"
echo "Création d'un point de montage partagé"
echo "######################################"
echo ""
sudo mkdir -p /mnt/sharedfolder_client
echo "OK"

echo ""
echo "#######################################################"
echo "Exportation du dossier du serveur sur le fichier client"
echo "#######################################################"
echo ""
echo "Veuillez rentrer l'adresse IP du serveur NFS :"
read ip_server
echo "L'ip du serveur de montage est : $ip_server"
echo ""
sudo mount $ip_server:/mnt/sharedfolder /mnt/sharedfolder_client
echo "Montage en cours..."
echo "OK"
echo ""
echo "███████╗██╗███╗   ██╗    ██╗"
echo "██╔════╝██║████╗  ██║    ██║"
echo "█████╗  ██║██╔██╗ ██║    ██║"
echo "██╔══╝  ██║██║╚██╗██║    ╚═╝"
echo "██║     ██║██║ ╚████║    ██╗"
echo "╚═╝     ╚═╝╚═╝  ╚═══╝    ╚═╝"
