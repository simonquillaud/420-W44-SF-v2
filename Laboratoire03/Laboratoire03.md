# Laboratoire 03 - Docker-Compose


Le but de se laboratoire est de jettre en place un environement de développement pour un site Web conprenant entre autre un site Wordpress.
Le site Web doit avoir une page index.html sitié à la racine de votre serveur Web (localhost:2022). Cette page doit présenter votre équipe et avoir un lien vers le site WordPress qui est situé à l'URL suivant : locahost:2022/wordpress.

- Le laboratoire s'effectue en groupe de 2.

 - Le temps alloué est de 2 séances. La remise est pour le 18 janvier 2022 minuit.

Vous devez fournir sur Léa ou par un adresse d'un dépôt :

- Un dépot git conprenant les branches suivantes : 
    - Le **main** (master) représente ce qu'il y a en production
    - Le travail sur les fonctionnalités et les correctifs sont effectuées dans leur propre branche nomé au nom de la fonctionnalité.
    - Les branches de fonctionnalité ou de correctif ne sont pas fusionnés directement dans master lorsque le travail est terminé ; elles sont fusionnés dans une branche nommée **develop**
    - Les branches de fonctionnalité ou de correctif ne sont pas fusionnés directement dans master lorsque le travail est terminé ; elles sont fusionnés dans une branche nommée develop
    - Votre dépôt doit contenir l'ensemble des fichiers nécessaires au projet.
    - Il doit égelement contenir un fichier .gitignore.
    
- Le fichier docker-compose.yml qui est dans votre dépôt doit permettre de mettre en place l'environement WordPress avec ses services, ses volumes et son réseau.
- Bien-sur, vous devez aussi fournir les fichiers dockerfile nécessaire.
- Une vidéo d'environ 5 mins (Maximum 10 mins) :
  - Explication de tous vos fichiers
  - Démonstration que le site fonctionne
  

À se rappeler :

- Vous aurez besoin d'un volume persistant pour la base de données et pour le serveur Web.
- Il faut passer les informations de la base de données à Wordpress et à MySQL par des variables d'environnement


Références à lire :

- Les branches : 
- [GIT, GitFlow et l’intégration continue pour les nuls](https://jp-lambert.me/git-gitflow-et-lint%C3%A9gration-continue-pour-les-nuls-a0b2f0b7c788)
- Vidéo sur Gitflow : https://www.youtube.com/watch?v=ZQAQ4HcskAY (peux-être)
- https://hub.docker.com/_/mysql
- Outils d'enregistrement : OBS, Screencast-o-matic, etc.

