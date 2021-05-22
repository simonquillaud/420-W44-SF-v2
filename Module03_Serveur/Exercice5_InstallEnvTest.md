# Exercice 5 - Installation d'un environnement de tests

- Évaluation : formative
- Durée estimée : 2 heures
- Système d'exploitation : Ubuntu 20.04 Lts Serveur

## Mise à jour du système

Il est une bonne habitude de mettre à jour vos dépôts et votre système avant de procéder à des installations.

Utilisez votre machine Ubuntu client (poste de développeur) pour établir une connexion avec votre serveur.

- Vérifier l'espace disque avant l'installation des applications suplémentaires.
- Pour ce faire créer un script bash sur votre serveur:
```bash
$nano espace.sh
```
```bash
#!/bin/bash
Fichier="espaceDisque.txt"

date >> $Fichier
df -H | grep /dev/sda >> $Fichier
df -H | grep /dev/mapper/vgo*  >> $Fichier

cat $Fichier
```
- Sauvegardez votre fichier en tapant sur Crtl+X et réponder Yes
- Faite la commande suivante pour rendre le script bash exécutable : 

```bash
$chmod a+x espace.sh
#Pour exécuter votre script bash :
./espace.sh
```



[Cliquez pour voir  mon résultat](Images/df1.png)
```bash

- Procéder à la mise à jour 
$sudo apt update
$sudo apt upgrade
```

## Installation de Git

```bash
$sudo add-apt-repository ppa:git-core/ppa
$sudo apt update
$sudo apt upgrade
$sudo apt install git
$git --version
```

**Fin exercice 5**

