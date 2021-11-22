# Laboratoire 02 - Installation d'une application Web

**But :** Le but de se laboratoire est de procéder à l'installation d'un site Web Wordpress dans un environnement de test nouvellement installé.

**Contexte :** Le laboratoire s'effectue en groupe de 2 personnes.

**Remise :** Vous devez déposer votre travail dans l'espace prévu sur LÉA au plus tard, le 2 décembre à 23h59.
Le temps alloué en classe est de trois (3) séances.

## Exigences :

- Votre machine virtuelle doit ête un Ubuntu serveur 20.04 Lts.

- Elle doit être situé dans le dossier E21_4391_420W44_ITV_JPD/Lab2

- Le nom de la vm est votre srvwebequipe[x]

- L'adresse IPv4 du serveur est : 10.100.2.[Votre numéro d'équipe +100]/24
  
  - Utiliser l'adapteur réseau VM DFC2
  
  - La passerelle est 10.10.100.2.1
  
  - Les serveur DNS sont : 199.202.105.108, 199.202.105.1

- Le nom d'host est webequipe[x].itv.csfoy.ca

- L'installation des services ( Web, Base de donées, PHP, WordPress) doit être totalement automatisé par un script, sauf pour la partie de finalisation dans le navigateur de l'installation de WordPress.

- Vous avez le choix entre Apache ou Nginx au niveau du serveur Web

- Le serveur de base de données intallé doit être MySQL 8.

- Vous devez avoir une page d'acceuil dans WordPress qui permet d'identifier le cours, l'équipes et la date de réalisation.

- Je dois pouvoir vérifier la page dans mon navigateur sur ma VM.

## Vous devez fournir :

- Un fichier script de l'installation.
- Une vidéo d'environ 10 minutes (Maximum 15 mins) :
  - Explication de l'installation
  - Affichage du Php Info avec les sections ayant un impact sur l'installation.
  - Démonstration que le site fonctionne avec au moins une  page d'accueil fonctionnelle.

## Références à consulter :

- Laboratoire 1
- WordPress : https://fr-ca.wordpress.org/
- Installation de WordPress sur Ubuntu : https://www.linuxshelltips.com/install-wordpress-on-ubuntu/, attention il s'agit d'une installation sur Apache et non Nginx.# Laboratoire 01 - Procédure d'installation d'une application Web
- Outils d'enregistrement : OBS, Screencast-o-matic, etc.
