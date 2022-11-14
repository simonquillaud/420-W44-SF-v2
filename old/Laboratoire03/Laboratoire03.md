# Laboratoire 03 - Docker-Compose


 - Le but de ce laboratoire est de mettre en place un environnement de développement pour un site Web comprenant des pages statiques et également un site Wordpress.
 - L'environnement doit comprendre trois services (Conteneurs) :
     - Nginx avec le site Web racine
     - PHP et WordPress 
     - MySQL
  - Le site Web doit avoir une page index.php situé à la racine de votre serveur Web (localhost:2022). 
      - Cette page doit présenter votre équipe et avoir un lien vers le site WordPress qui est situé à l'URL suivant : wordpress/index.php
      - Un fichier main.css doit être présent pour les styles du site Web.
  - Votre travail doit être suivi avec Git.

<hr>

Le laboratoire s'effectue en groupe de 2 personnes.

Le temps alloué est de 2 séances. La remise est pour le 18 janvier 2022 minuit.

Vous devez fournir sur Léa ou par une adresse d'un dépôt GitLab:

- Un dépôt git comprenant les branches suivantes : 
    - Le **main** (master) représente ce qui serait en production après que votre client autorise la mise en production.
    - Le travail sur les fonctionnalités et les correctifs sont effectués dans leur propre branche nommée au nom de la fonctionnalité. Lors des fusions, ne supprimez pas les branches.
    - Les branches de fonctionnalité ou de correctif ne sont pas fusionnées directement dans master lorsque le travail est terminé ; elles sont fusionnées dans une branche nommée **develop**
    - Votre dépôt doit contenir l'ensemble des fichiers nécessaires au projet.
    - Il doit également contenir un fichier .gitignore.
    - Je veux pouvoir historiser votre travail. C'est le rôle des commits. Faites-en plus que moins. 
    
- Le fichier docker-compose.yml qui est dans votre dépôt doit permettre de mettre en place l'ensemble de votre environnement de développement avec ses services, ses volumes (en bind mounting) et son propre réseau virtuel.
    - Voici un exemple des sections que votre fichier docker-compose doit comprendre  :
        ```Dockerfile

        version: '3'
        
        services :
          ServeurWeb:
            image:
            command:
            environnement:
            volumes: 
        
          ServeurBD:
         
          ServeurWorPress:

        networks :
          MonSiteWeb:
        ```

    
- Une vidéo d'environ 5 minutes (Maximum 10 min) :
  - Explication de votre fichier docker-compose.
  - Démonstration que le site fonctionne
  - Démonstration que vous êtes sur un réseau virtuel séparé.
  

Références à lire :

- [Reame.md](readme.md) : Les commandes GIT à utiliser.

- [GIT, GitFlow et l’intégration continue pour les nuls](https://jp-lambert.me/git-gitflow-et-lint%C3%A9gration-continue-pour-les-nuls-a0b2f0b7c788)

- [Docker running Nginx, PHP-FPM, Composer, MySQL and PHPMyAdmin.](https://github.com/nanoninja/docker-nginx-php-mysql)

- Outils d'enregistrement : OBS, Screencast-o-matic, etc.