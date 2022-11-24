# Travail pratique 1 - Intégration continue

## Informations

- Évaluation : TP
- Type de travail : en binôme
- Durée : 2 x 6 heures + travail à la maison
- Plate forme : Azure DevOps et dotnet/react

## Objectifs

- Montrer que vous avez compris l'utilisation de branches, des pull-requests et des migrations
- Montrer que vous avez compris le principe d'intégration continue et son intégration dans le cycle DevOps
- Créer deux pipelines d'intégration continue dans Azure, un en mode classic et l'autre en YAML
- Être capable d'expliquer la partie théorique et technique

## Remise

- Vidéo :
  - Branches et pull-requests
  - Démonstration des étapes à réaliser localement
  - Explication et démonstration des pipelines
  - Démonstration du fonctionnement des artefacts
- Copies d'écran (pipeline classic) :
  - Liste des tâches
  - Paramètres de chaque tâche
  - Variables
- Liste des commandes de compilation, ajout de projets / package nuget
- Fichier YAML (pipeline YAML)
- Répartition des tâches entre partenaires avec nombre d'heures
- Répondre aux questions suivantes :
  - En quoi l'utilisation des outils DevOps permet d'améliorer la traçabilité ? (Ne pas oublier de décrire ce qu'est la traçabilité)
  - Quels types d'actions peut-on et devrait-on trouver dans un flux de travail d'intégration continue ?
- Fichier AUTHORS.md :
  - lien YouTube
  - lien Git
  - Vos informations (prénom / nom / matricule)

## Projet

Le projet est un vieux projet développé en dotnet 3.1. Il se trouve dans le répertoire ```src``` du présent répertoire.

## Étape 1 - Gestion de source et intégration continue

Vous devez mettre le projet sous contrôle de source et mettre en place des pipelines d'intégration continue afin d'améliorer la traçabilité et la qualité logicielle.

- Vous devez créer un nouveau projet d'équipe et y ajouter le code du projet dans le dépôt par défaut dans la branche "main" (n'oubliez pas le .gitignore !)
- Vous devez créer une branche "develop"
- Vous devez créer un pipeline classic d'intégration continue qui construit 3 artefacts : un pour l'interface utilisateur (GC.ConsoleUI) et un par traitement lot (GC.Batch.ModifierNomPrenomPremiereLettreMajuscules et GC.Batch.ModifierPaysMajusculesClients)
- Créer une nouvelle version de ce pipeline avec la description YAML
- Les pipelines doivent se déclencher automatiquement à chaque modification des branches "main" et "develop"

## Étape 2 - Préparation d'un projet web

Une nouvelle va être prochainement créée afin de moderniser l'interface utilisateur actuelle du projet : elle va réaliser une application web avec les technologies ASP.Net MVC et react. L'application sera proposée en mode authentifiée grâce à une authentification individuelle.

Vous devez donc :

- Créer une branche pour ajouter le nouveau projet web
- Faite une pull-request pour l'intégrer dans la branche la plus logique
- Modifiez les pipelines afin d'ajouter un artefact pour l'application Web
- Testez vos pipelines, ainsi que les artefacts de sortie
