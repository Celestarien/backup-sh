#!/bin/bash

clear

echo "██████╗  █████╗  ██████╗██╗  ██╗██╗   ██╗██████╗ ███████╗"
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║   ██║██╔══██╗██╔════╝"
echo "██████╔╝███████║██║     █████╔╝ ██║   ██║██████╔╝███████╗"
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║   ██║██╔═══╝ ╚════██║"
echo "██████╔╝██║  ██║╚██████╗██║  ██╗╚██████╔╝██║     ███████║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝"
echo ""

borg list /mnt/sharedfolder_client # Lister les backups
echo ""
# Extraction d'une backup
echo "Nom du backup à extraire :"
read backup_extract

borg extract /mnt/sharedfolder_client::$backup_extract

echo "Extrait avec succès !"
