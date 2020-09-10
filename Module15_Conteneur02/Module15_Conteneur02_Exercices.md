# Module 15 - Conteneur 02 - Docker : volume et redirection de port

Note : créez un pour le module 15 puis un répertoire par exercice.

## Exercice 1 - Busybox

### Exercice 1.1 - Réseau par défaut (bridge)

- Ouvrez deux terminaux, powershell ou bash, et sur chacun, lancez un conteneur de l'image "busybox" en mode intéractif.
- Trouvez l'adresse IP de chaque conteneur
- Effectuez une requête ICMP d'un conteneur vers l'autre. Qu'observez-vous ?
- Essayez de faire une requête ICMP vers "www.google.com". Qu'observez-vous ?
- Quittez les conteneurs
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

### Exercice 1.2 - Réseau none

- Lancez un conteneur de l'image "busybox" avec l'option "--network none"
- Essayez de déduire l'adresse IP du conteneur. Qu'observez-vous ?
- Essayez de faire une requête ICMP vers "www.google.com". Qu'observez-vous ?
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

### Exercice 1.3 - Réseau host ([Linux seulement](https://docs.docker.com/network/host/))

- Lancez un conteneur de l'image "busybox" avec l'option "--network host"
- Essayez de déduire l'adresse IP du conteneur. Qu'observez-vous ?
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

## Exercie 2 - Nginx - réseau

Dans cet exercice, vous allez devoir utiliser l'image "nginx" afin de créer un serveur web ([Documentation Nginx](https://hub.docker.com/_/nginx)).

### Exercice 2.1 - Nginx - premiers tests

- Sur un premier terminal, lancez en arrière plan (-d) l'image "nginx" sans spécifier de redirection de port avec le nom "mon_nginx" (--name)
- Faite un "docker inspect mon_nginx" afin de trouver l'adresse du conteneur
- Sur un autre terminal, lancez l'image "browsh/browsh" en mode intéractif (-it)
- Faites un "Ctrl-l" et tapez l'adresse IP de votre serveur web. Le site par défaut d'Nginx devrait s'afficher. Pour quitter faites un "Ctrl-q" (pour les autres commandes faites un "F1").
- À partir de votre navigateur favori, essayer de naviguer l'adresse IP que vous aviez. Essayez avec l'adresse locale.
- Qu'observez-vous et pourquoi ?
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

### Exercice 2.2 - Nginx - liaison

- Recréé un conteneur, mais cette fois-ci, faites une liaison entre le port 1234 de l'hôte vers le port 80 du conteneur.
- Refaites les tests de l'exercice précédent
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

## Exercice 3 - Ngnix - volume

- Créez vous un répertoire temporaire et créez un fichier "index.html". Dans ce fichier, écrivez un code html simple afin d'afficher "Un fichier de mon hôte servi à partir d'un conteneur"
- Par défaut, l'image "Nginx" utilise le répertoire "/usr/share/nginx/html" comme base de recherche de ses fichiers statiques. Vous allez devoir faire un montage afin que votre répertoire soit monté vers ce chemin au moment du démarrage du conteneur
- Validez que vous voyez bien votre page
- Supprimez votre conteneur et lancez en un nouveau en faisant maintenant un montage en lecture seule (:ro : voir documentation)
- Validez que le tout fonctionne toujours
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.

## Exercice 4 - Application MVC core

### Exercice 4.1 - Création d'un projet MVC en .Net core

- À partir d'un terminal et de la commande dotnet, créez une application :
  - Type : mvc
  - Nom : webapp
- Modifiez le fichier "Views/Home/Index.cshtml" pour y ajouter votre prénom / nom
- Testez que l'application fonctionne localement

### Exercice 4.2 - Création d'un compte docker hub

- Allez sur le site de docker hub et créez-vous un compte
- Créez un dépot nommé "webapp"

### Exercice 4.2 - Création d'une image

- Placez vous à la racine du projet
- Créez le fichier Dockerfile avec le contenu suivant :

```Dockerfile
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "webapp.dll"]
```

- Assurez-vous de bien comprendre chaque ligne du fichier Dockerfile
- Construisez l'image "<votre_docker_id>/webapp" avec la version "latest"
- Exécutez un conteneur à partir de cette image en liant le port 80 du conteneur au port 8080 de l'hôte
- Validez que le tout fonctionne (attention vous allez être en http)

### Exercice 4.3 - Publication

- Allez sur le site de docker hub et créez-vous un compte
- Créez un dépot nommé "webapp"
- Sur un terminal faites un "docker login" et tapez vos informations de connexion
- Faites un "docker push <votre_docker_id>/webapp:latest". La première fois que vous allez effectuer cette commande, il va vous demander vos informations de connexion.
- Allez dans votre compte sur docker hub et validez que votre image est bien présente.
- Supprimez votre version locale
- Démarrez un conteneur à partir de l'image qui est sur docker hub et validez que tout fonctionne
- Demandez le nom de l'image d'un de vos collègues ou utilisez mon image "pifou/webapp"
- Démarrez un conteneur avec cette image et validez que tout fonctionne
- Nettoyez vos conteneurs en supprimant ceux créés dans cet exercice.
