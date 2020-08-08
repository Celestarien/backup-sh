echo "Action à réaliser :"
echo ""
echo "1 - Sauvegarde toutes les minutes"
echo "2 - Sauvegarde tous les jours"
echo "3 - Sauvegarde toutes les semaines"
echo "4 - Sauvegarde tous les mois"
echo "5 - Retour au menu"

read choix


if [ $choix = 1 ]
	then
	echo "* * * * * root ~/Projet-UF-Sauvegarde/script/save-auto.sh" >> /etc/crontab
elif [ $choix = 2 ]
	then
	echo "0 1 * * * root ~/Projet-UF-Sauvegarde/script/save-auto.sh" >> /etc/crontab
elif [ $choix = 3 ]
	then
	echo "0 0 * * 0 root ~/Projet-UF-Sauvegarde/script/save-auto.sh" >> /etc/crontab
elif [ $choix = 4 ]
	then
	echo "0 0 1 * * root ~/Projet-UF-Sauvegarde/script/save-auto.sh" >> /etc/crontab
elif [ $choix = 5 ]
	then
	clear
	exit 1
else
	../start.sh

fi
