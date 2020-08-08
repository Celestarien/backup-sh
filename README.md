# Projet-UF-Sauvegarde

## Introduction du sujet

Ce projet à pour but de développer un système de sauvegarde afin d'assurer une plus grande sécurité des données de l'utilisateur à travers leurs pérennisation.

## Objectifs

- Sauvegarder les données
- Automatiser la sauvegarde
- Restaurer les données
- Rédiger un documentation du système de sauvegarde

### Idées initiales

- Créer un Script Shell de sauvegarde du système (wrap de commandes borg)
- Utiliser Crontab pour l'automatiser
- Sauvegarder les données sur un VPS à l'aide de Borg (https://asciinema.org/a/133292?autoplay=1&speed=1)
- Serveur NFS

### Configuration du VPS

- Installation d'un serveur NFS
- Installation d'un serveur Apache2 
- Installation de MySQL
- Installation de PHP

#### Installation du serveur NFS sur le VPS

Abandon...
On passe en local

### Deploiement

- Téléchargez l'archive contenant les différents programmes avec la commande : 

`git clone https://github.com/ThibaultFeugere/Projet-UF-Sauvegarde.git`

- Exécutez la commande permettant de donner le droit d'exécution des scripts :

`chmod +x -R Projet-UF-Sauvegarde/`

- Rendez-vous dans le dossier qui vous venez de cloner :

`cd Projet-UF-Sauvegarde/`

- Lancez le script : 

`./start.sh`

- Sélectionnez l'action **1**

- Choisir la version **client** ou **serveur** en fonction de vôtre besoin
- Have fun :)

**Attention, pour que le protocole NFS soit bien déployé avec notre script, il est indispensable d'installer le serveur NFS avant le client NFS**

### Procédures

**Installation du serveur NFS**

- Lancer `./start.sh`
- Dans le menu, choisir l'option 1
- Ensuite, choisir l'option d'installation du serveur
+ + Le script est commenté par des echos qui vous indiquent les étapes.
- Installation `sudo` avec la commande `apt-get install sudo` afin d'être compatible avec Ubuntu notamment. Après discussion avec Léo, l'exécution de toutes les commandes en sudo n'est pas une bonne idée, nous corrigerons ce problème dans les versions futures.
- Mise à jour des dépots APT avec la commande `apt-get update`
- Installation `nfs-kernel-server`, un module qui se rajoute au kernel du système avec la commande `apt-get install nfs-kernel-server`
- Création du dossier /mnt/sharedfolder qui sera partagé entre les deux machines avec la commande `mkdir -p /mnt/sharedfolder`
- Changement du groupe propriétaire avec la commande `chown nobody:nogroup /mnt/sharedfolder`. Ces groupes sont générés par NFS, autrement dit le client sera considéré comme propriétaire du dossier.
- Ajout de permissions avec la commande `chmod 777 /mnt/sharedfolder` qui donne le droit le lecture, d'écriture et d'exécution à tout le monde.
- Permissions d'accès au serveur avec la commande `echo "/mnt/sharedfolder $ip_client(rw,sync,no_subtree_check)" >> /etc/exports`. Le fichier /etc/exports va nous permettre d'exporter le dossier sharedfolder vers le client afin de créer la liaison, lors de l'installation sur le client, il nous faudra l'adresse IP du serveur et la liaison sera effectuée.
- Exportation de la configuration avec la commande `exportfs -a` afin d'exporter la nouvelle configuration NFS pour tout (-a all)
- Redémarage de NFS Kernel Server avec la commande `systemctl restart nfs-kernel-server`. On rédemarra le service.
- Installation d'un pare-feu qui s'appelle UFW signifiant Uncomplicated FireWall avec la commande `apt-get install ufw -y` afin de n'autoriser uniquement le client que l'on va configurer à se connecter
- Autorisation de l'adresse IP du client à se connecter sur le port NFS qui, par défaut, est le port 2049 avec la commande `ufw allow from $ip_client to any port nfs`
- Démarrage du pare-feu avec la commande `ufw enable` afin de mettre en place le pare-feu sur le serveur
- Affichage du status du pare-feu pour vérifier que les commandes effectuées sont effectives avec la commande `ufw status`

**Installation du client NFS**

L'installation du client NFS est beaucoup plus rapide que le serveur NFS car celui-ci doit seulement pouvoir communiquer avec le serveur sans rajouter un module sur le Kernel.

- Dans le menu, choisir l'option 1
- Par la suite, choisir l'option d'installation client
- Installation `sudo` avec la commande `apt-get install sudo` afin d'être compatible avec Ubuntu notamment.
- Mise à jour des dépots APT avec la commande `apt-get update`
- Installation du fichier de prise en charge NFS avec la commande `apt-get install nfs-common -y`
- Installation de Borgbackup, afin de faire du wrapping de commande, avec la commande `apt install borgbackup -y`
- Création d'un point de montage partagé avec la commande `mkdir -p /mnt/sharedfolder_client` 
- Exportation du dossier du serveur sur le fichier client avec la commande `mount $ip_server:/mnt/sharedfolder /mnt/sharedfolder_client`. Désormais le dossier du serveur est lié à celui du client est tous les dossiers créés dans /mnt/sharefolder sur le serveur ou /mnt/sharedfolder_client sur le client seront partagés.

Vous pouvez faire des tests si vous le souhaitez mais pour le bon fonctionnement du script, il est fortemment conseillé de laisser se dossier vide avant l'initialisation de BorgBackup.

**Faire une backup**

- Dans le menu, choisir l'option 2
- Entrer le nom que vous souhaitez donner à la backup
- Entrer le repertoire que vous souhaitez enregistrer dans la backup (tous les fichiers du repertoire sont sauvegardés)
- Le programme initialise le dépôt
- Créer une backup dans le fichier /mnt/sharedfolder_client aec le nom entré précédemment
- Affiche la liste de toutes les backups

**Extraire une backup**

- Dans le menu, choisir l'option 3
- La liste de toutes les backups s'affiche
- Choisir le nom de la backups à extraire
- Le fichier est extrait à l'endroit où se situe `start.sh`

**Supprimer une backup**

- Dans le menu, choisir l'option 4
- Une demande de validation apparait, choisissez l'option 1
- Une seconde demande de validation apparait, entrer `YES` (en majuscule)
- Toutes les backups sont supprimées

**Aide**

- Dans le menu, choisir l'option 5
- L'aide s'affiche

**Sortir**

- Dans le menu, choisir l'option 6
- Vous sortez du programme
