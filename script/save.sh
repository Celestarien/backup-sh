#!/bin/bash

clear
echo "Nom de la backup que vous voulez faire :"
read backup_name
echo ""
echo "Nom du répertoire à sauvegarder :"
read path_backup
echo ""

borg init --encryption=none /mnt/sharedfolder_client/ # Initialisation de Borg

borg create --stats --progress --compression lz4 /mnt/sharedfolder_client::$backup_name $path_backup # Créer backup

borg list /mnt/sharedfolder_client # Lister les backups
