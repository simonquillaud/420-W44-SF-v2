# Exercice 5 - Installation d'un environnement de tests

- Évaluation : formative
- Durée estimée : 2 heures
- Système d'exploitation : Ubuntu 20.04 Lts Serveur

## Mise à jour du système

Il est une bonne habitude de mettre à jour vos dépôts et votre système avant de procéder à des installations.

Utilisez votre machine Ubuntu client (poste de développeur) pour établir une connexion avec votre serveur.

```bash
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

