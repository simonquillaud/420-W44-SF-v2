# Exercice 5 - Installation d'un environnement de tests


- Évaluation : formative
- Durée estimée : 2 heures
- Système d'exploitation : Ubuntu 20.04 Lts Serveur


## Mise à jour du système


Il est une bonne habitude de mettre à jour vos dépôts et votre système avant de procéder à des installations.


Utilisez votre machine Ubuntu client (poste de développeur) pour établir une connexion avec votre serveur.


- Vérifier l'espace disque avant l'installation des applications supplémentaires.
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
- Sauvegardez votre fichier en tapant sur Crtl+X et répondez Yes
- Faite la commande suivante pour rendre le script bash exécutable : 


```bash
$chmod a+x espace.sh
#Pour exécuter votre script bash :
./espace.sh
```




[Cliquez pour voir  mon résultat](Images/espace.png)


- Procéder à la mise à jour 
```bash
$sudo apt update
$sudo apt upgrade
```
- et de nouveau, lancer votre script espace.sh
- Vous ne devriez pas voir une différence notable, car une mise à jour ne prend pas beaucoup d'espace disque.


## Installation de Git


```bash
$sudo add-apt-repository ppa:git-core/ppa
$sudo apt update
$sudo apt upgrade
$sudo apt install git
$git --version
```

## Installation NGINX

```bash
$sudo apt install nginx
```
- Répondez oui
- Vérifier le fonctionnement du serveur en tapant la commande suivante :
```bash
$systemctl status nginx
```
- Véfifier le fonctionnement de votre serveur Web dans votre navigateur du poste client. ([images](Images/nginx.png))

## Installation MySQL Serveur 8.0
- Nous allons utiliser la version mysql-server-8.0


```bash
$sudo apt install mysql-server-8.0
```
- Répondez oui
- Installer le script de sécurité MySQL.([Documentation MySQL](https://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html))
- Pour rappel, ce programme vous permet d'améliorer la sécurité de votre installation MySQL de la manière suivante :
    - Vous pouvez définir un mot de passe pour les comptes root.
    - Vous pouvez supprimer les comptes root qui sont accessibles depuis l'extérieur de l'hôte local.
    - Vous pouvez supprimer les comptes d'utilisateurs anonymes.
    - Vous pouvez supprimer la base de données de test (à laquelle tous les utilisateurs, même les utilisateurs anonymes, peuvent accéder par défaut) et les privilèges qui permettent à quiconque d'accéder aux bases de données dont le nom commence par test_.


```bash
$sudo mysql_secure_installation
```
- Le plug-in validate_password peut être utilisé pour vérifier la force des mots de passe. Si le plug-in n'est pas installé, mysql_secure_installation demande à l'utilisateur s'il doit l'installer. Tous les mots de passe saisis ultérieurement sont vérifiés à l'aide du plug-in s'il est activé. 
- Le système vous demandera le mot de passe root MySQL. Tapez Y
- Ensuite, le programme d’installation décrira les fonctionnalités du plug-in Validate Password. Vous devrez sélectionner le niveau de sécurité. 
    - Vous devez utiliser  **2 pour STRONG** . 
    - Nous devons placer notre serveur comme si nous étions en production, et non en développement comme votre poste client. Donc le niveau de sécurité et plus important.
    - Vous devrez par la suite répondre niveaux de politique de validation des mots de passe suivante  :  STRONG Longueur >=8 numérique, chargement de la case, caractères spéciaux et ne pas être un mot du dictionnaire.
    - **Exemple** : e4l*j3Wj


- Votre mot de passe root devra suivre toutes les exigences que vous avez configurées à l’étape précédente.
- Le système vous demandera les fonctions de sécurités suivantes : 
    - Supprimer les utilisateurs anonymes ? Y
    - Désactiver la connexion root à distance ? Y
    - Supprimer la base de données de test et y accéder ? Y
    - Recharger les tables de privilèges maintenant ? Y


- Vérifier que MySQL fonctionne, entrer le commande : 
```bash
$sudo service mysql status
``` 
- Par curiosité, lancer votre script d'espace disque. Vous verrez combien d'espace disque utilise le serveur de base de données MySQL sans la présence des bases de données bien sûr. 



```bash
./espace.sh
```
[Cliquez pour voir  mon résultat](Images/espace2.png)
- Remarquez seule les partitions /root et /var ont changés.sudo


- Comme pour votre poste client, vérifier les connexions possibles au serveur MySQL : 

```bash
sudo apt install net-tools
netstat -paunt |grep 3306
```
Résultat attendus : 
```bash
tcp     0    0    127.0.0.1:33060     0.0.0.0:*     LISTEN
tcp     0    0    127.0.0.1:3306      0.0.0.0:*     LISTEN
```
### Tester l’installation de MySQL

Le client MySQL a également été installé. Nous allons l’utiliser pour tester notre installation.
— Tapez la commande suivante pour accéderr au client :
```bash
$sudo mysql -u root -p
```
-- Entrez le nouveau mot de passe de root tel que définit plus haut.

[Cliquez pour voir  mon résultat](Images/conMySQL.png)

- Quelques vérfications d'usages : 
```bash
show databases;
select user, host from mysql.user;
```
- Création d'un usager pour l'administration :

```bash
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'change-with-your-secure-password';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
```
- Vérifier la présence de l'usager : 
```bash
select user, host from mysql.user;
quit
```


## Le langage de programmation PHP

Mise en situation :  Nous allons avoir besoins du langage de programmation PHP pour la mise ne production de notre site Web avec WorPress dans les futures exercices.

```bash
$sudo apt install php-fpm php-mysql
```
- Répondez oui 

## Installation de phpMyAdmin 
- Vous pouvez procédez à l'installation de phpMyAdmin en suivant ce tutoriel en ligne :
[How To Install and Secure phpMyAdmin with Nginx on an Ubuntu 20.04 Server](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-with-nginx-on-an-ubuntu-20-04-server)


## Finalisation
- Lancez le script espace.sh
- Analysez l'espace disque utilisé pour notre installation.

**Fin exercice 5**