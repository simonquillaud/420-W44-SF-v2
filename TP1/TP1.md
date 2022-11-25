# Travail pratique 1 - Intégration continue

## Informations

- Remise du travail: 28 novembre 2022, 23:59
- Ce travail est réalisé en équipe de 2 personnes et seuls les membres de cette équipe y contribuent
- Toutes les réponses fournies doivent être originales (produites par l’étudiant ou un membre de l’équipe)
- Toute copie de code, de portion de code, d’algorithme ou de texte doit faire mention de sa source
- L’emprunt ou la copie de code ou de portions de code est interdite
- Tout constat de plagiat, tricherie ou fraude sera automatiquement déclaré à la Direction et les sanctions prévues seront appliquées
- Durée : 2 x 3 heures + travail à la maison
- Plate forme : Azure DevOps et dotnet/react

## Objectifs

- Montrer que vous avez compris l'utilisation de branches, des pull-requests et des migrations
- Montrer que vous avez compris le principe d'intégration continue et son intégration dans le cycle DevOps
- Créer deux pipelines d'intégration continue dans Azure, un en mode classic et l'autre en YAML
- Être capable d'expliquer la partie théorique et technique

## Remise

- Vidéo sur YouTube (non listée) (35 points):
  - Branches et pull-requests (10 points)
  - Démonstration des étapes à réaliser localement (5 points)
  - Explication et démonstration des pipelines (15 points)
  - Démonstration du fonctionnement des artefacts  (5 points)
- Copies d'écran (pipeline classic) (15 points) :
  - Liste des tâches
  - Paramètres de chaque tâche
  - Variables
  - L'ordre logique des images est indiqué par le tri des noms de fichier par ordre lexicographique
- Fichier YAML (pipeline YAML) (15 points)
- Liste des commandes de compilation, ajout de projets / package nuget (10 points)
- Répartition des tâches entre partenaires avec nombre d'heures (5 points)
- Répondre aux questions suivantes (20 points):
  - En quoi l'utilisation des outils DevOps permet d'améliorer la traçabilité ? (Ne pas oublier de décrire ce qu'est la traçabilité)
  - Quels types d'actions peut-on et devrait-on trouver dans un flux de travail d'intégration continue ?
- Fichier AUTHORS.md : (Jusqu'à -10 points pour non respect des consignes)
  - lien YouTube
  - lien Git
  - Vos informations (prénom / nom / matricule)

## Projet

Le projet est un vieux projet développé en dotnet 3.1. Il se trouve dans le répertoire ```src``` du présent répertoire.

## Étape 1 - Gestion de source et intégration continue

Vous devez mettre le projet sous contrôle de source et mettre en place des pipelines d'intégration continue afin d'améliorer la traçabilité et la qualité logicielle.

- Vous devez créer un nouveau projet d'équipe et y ajouter le code du projet dans le dépôt par défaut dans la branche "main" (n'oubliez pas le .gitignore !)
- Vous devez créer une branche "develop"
- Vous devez créer un pipeline classic d'intégration continue qui construit 3 artefacts (donc 3 "Azure publish" et non 1 comme dans les exercices) : un pour l'interface utilisateur (GC.ConsoleUI) et un par traitement lot (GC.Batch.ModifierNomPrenomPremiereLettreMajuscules et GC.Batch.ModifierPaysMajusculesClients)
- Créer une nouvelle version de ce pipeline YAML
- Les pipelines doivent se déclencher automatiquement à chaque modification des branches "main" et "develop"

## Étape 2 - Préparation d'un projet web

Une nouvelle équipe de développeur va être prochainement créée afin de moderniser l'interface utilisateur actuelle du projet : elle va réaliser une application web avec les technologies ASP.Net MVC et react. L'application sera proposée en mode authentifiée grâce à une authentification individuelle.

Vous devez donc :

- Créer une branche pour ajouter le nouveau projet web
- Faire une pull-request pour l'intégrer dans la branche la plus logique
- Modifier les pipelines afin d'ajouter un artefact pour l'application Web
- Tester vos pipelines, ainsi que les artefacts de sortie

Tout partage de code, d'explication, de bouts de texte, etc. est considéré comme du plagiat. Pour plus de détails, consultez le site (et ses vidéos) [Sois intègre du Cégep de Sainte-Foy](http://csfoy.ca/soisintegre) ainsi que [l'article 6.1.12 de la PÉA](https://www.csfoy.ca/fileadmin/documents/notre_cegep/politiques_et_reglements/5.9_PolitiqueEvaluationApprentissages_2019.pdf)
