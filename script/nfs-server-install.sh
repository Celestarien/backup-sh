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
echo "#################################"
echo "Installation de NFS Kernel Server"
echo "#################################"
echo ""
sudo apt install nfs-kernel-server -y

echo ""
echo "######################################"
echo "Création d'un point de montage partagé"
echo "######################################"
echo ""
sudo mkdir -p /mnt/sharedfolder
echo "OK"

echo ""
echo "########################################"
echo "Suppression des permissions restrictives"
echo "########################################"
echo ""
sudo chown nobody:nogroup /mnt/sharedfolder
sudo chmod 777 /mnt/sharedfolder
echo "OK"

echo ""
echo "###############################"
echo "Permissions d'accès au serveur"
echo "###############################"
echo ""
echo "Veuillez rentrer l'adresse IP du client NFS :"
read ip_client
echo "L'adresse IP du client est : $ip_client"
echo ""
echo "Édition du fichier /etc/exports"
echo "/mnt/sharedfolder $ip_client(rw,sync,no_subtree_check)" >> /etc/exports

echo ""
echo "###############################"
echo "Exportation de la configuration"
echo "###############################"
echo ""
sudo exportfs -a
echo "OK"

echo ""
echo "###############################"
echo "Redémarage de NFS Kernel Server"
echo "###############################"
echo ""
sudo systemctl restart nfs-kernel-server
echo "OK"

echo ""
echo "##########################"
echo "Installation d'un pare-feu"
echo "##########################"
echo ""
sudo apt-get install ufw -y

echo ""
echo "######################################"
echo "Autorisation de l'adresse IP du client"
echo "######################################"
echo ""
sudo ufw allow from $ip_client to any port nfs
echo "OK"

echo ""
echo "######################################"
echo "Démarrage du pare-feu"
echo "######################################"
echo ""
sudo ufw enable

echo ""
echo "##################"
echo "Status du pare-feu"
echo "##################"
echo ""
sudo ufw status
echo ""
echo "███████╗██╗███╗   ██╗    ██╗"
echo "██╔════╝██║████╗  ██║    ██║"
echo "█████╗  ██║██╔██╗ ██║    ██║"
echo "██╔══╝  ██║██║╚██╗██║    ╚═╝"
echo "██║     ██║██║ ╚████║    ██╗"
echo "╚═╝     ╚═╝╚═╝  ╚═══╝    ╚═╝"
