# Exercice 5 - Installation d'un environnement de test

- Évaluation : formative
- Durée estimée : 2 heure
- Système d'exploitation : Ubuntu 20.04 Lts Serveur


## Mise à jour du système

Il est une bonne habitude de mettre à jour vos dépot et votre système avant de procéder à des isntallations.

Utilisez votre machine Ubuntu client (poste de développeur) pour établir une connexion avec votre serveur.


```bash
$sudo apt update
$sudo apt upgrade
```

**Utiliser les mise à jour de sécurité automatique**

L'idée est  de configurer Ubuntu Server pour effectuer automatiquement les mises à jour de sécurité, et donc bien que nous devions nous occuper d'autres mises à jour (par exemple, celles de certains services ou applications que nous installerons), au moins nous ferons une bonne partie du travail de manière automatisée.
-  Dans un premier temps, nous allons vérifier ce qui est prévue dans le configuration d'Ubuntu serveur par défaut. :
```bash
$sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```
- En principe il n'y a rien à modifier ici mais nous pourrions décider de désactiver ou activé des mises à jours en commentant ou décomentant.
- Pour voire l'[Image](Images/UpdateAuto.png)

Par contre, c'est dans le fichier suivant, qu'on active la mise à jour automaitque qui ne l'est pas par défaut :
```bash
$sudo nano /etc/apt/apt.conf.d/10periodic
```
- Modifiez le comme suit :
```bash
APT :: Periodic :: Update-Package-Lists "1";
APT :: Periodic :: Download-Upgradeable-Packages "1";
APT :: Periodic :: AutocleanInterval "7";
APT :: Periodic :: Unattended-Upgrade "1";
```

Pour voire l'[Image](Images/UpdateSec.png)
 

**Fin exercice 5**
