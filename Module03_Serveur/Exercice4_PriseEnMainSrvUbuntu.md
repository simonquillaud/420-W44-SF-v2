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
- Éditez le fichier suivant :
```bash
$sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```
Ce que nous devons faire est de commenter la section Origines autorisées comme on le voit ci-dessous:
```bash
// Automatically upgrade packages form these (origin:archive) pairs
Unattended-Upgrade :: Allowed-Origins {
"$ {Distro_id}: $ {distro_codename} -security";
// "$ {distro_id}: $ {distro_codename} -updates";
// "$ {distro_id}: $ {distro_codename} -proposé";
// "$ {distro_id}: $ {distro_codename} -backports";
};
```




-

**Fin exercice 5**
