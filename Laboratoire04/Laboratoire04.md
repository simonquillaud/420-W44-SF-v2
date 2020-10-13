# Laboratoire 4 - Mise en place d'un projet DevOps avec déploiement

Le but de se laboratoire est de monter un site .Net core MVC avec SQL serveur dans Azure.

Le laboratoire s'effectue en groupe de 4 maximum.

Le temps alloué est de 2 1/2 séances. La remise est pour le mardi 20 octobre 2020 minuit.

Vous devez fournir :

- Une adresse Azure DevOps avec :
  - Un projet
  - Un git
  - Vos fichiers de description d'infrastructure
  - Deux branches
  - Deux pipelines
  - Deux releases
  - Votre enseignant comme administrateur du projet
- Une vidéo d'environ 10 mins (Maximum 15 mins) :
  - Une démonstration de requête de tirage de develop vers master
  - Explication d'un de vos pipilines et des deux releases
  - Démontrez que les ressources sont créées dans Azure
  - Démontrez que les environnements dev, pre-prod et prod fonctionnels

## Étape 1 - Création du projet d'équipe dans Azure DevOps

- Créez un projet d'équipe avec le modèle Agile.
- Donnez-vous les droits entre membres d'équipe (utilisateur minimalement).
- Ajoutez pfleon@csfoy.ca comme utilisateur et administrateur.
- Créez un dépot Git.
- Créez un projet Visual Studio .Net core MVC 3.1 avec authentification individuelle.
- Ajoutez le projet dans le dépot de source : le projet doit être placé dans le répertoire src à la racine du dépot.

Le dépot de source doit avoir deux branches : master et develop.

## Étape 2 - Création d'un modèle de site

- À partir du portail Azure (https://portal.azure.com), lancez la fenêtre de création d'une ressource de type "Webapp + SQL" : choisissez le nom d'utilisateur BD "monApplication" et le mot de passe "Passw0rd".
- À la place de confirmer la création de la ressource, choisissez "Options d'automatisation" et téléchargez les fichiers associés (Fichiers ARM : Azure Resource Manager).
- Copiez ces fichiers dans le gestionnaire de source : les fichiers doivent être placés dans le répertoire deployment à la racine du dépot.

## Étape 3 - Créez des pipelines et release

- Créez un pipeline de compilation pour la branche develop et master. Les artéfacts de sorti sont le site publié et le répertoire de déploiement.
- Créez un release pour la branche develop et master :
  - Release develop :
    - Déclenchement : automatique
    - Déploie sur l'environnement dev
    - Si déploiement réussi : déploie sur l'environnement fonctionnel
  - Release master :
    - Déclenchement : automatique
    - Déploie automatiquement sur l'environnement dev et pre-prod
    - Attente d'approbation d'un responsable pour déployer en prod. Le responsable sera une unique personne désignée dans votre équipe.

Le déploiement contient l'infrastructure et le site.

***Si vous n'arrivez pas à déployer votre infrastructure, créez votre infrastructure manuellement et démontrez simplement le déploiement de votre application***
