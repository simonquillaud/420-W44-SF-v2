# Module 14 - Conteneurs docker

## Préambule - Testez votre installation

- Sous Windows : utilisez le terminal Windows, lancez une console Ubuntu 
  - Testez la commande "docker". Si le programme ne se lance pas installez le (package docker)
  - Si vous avez un qui parle de l'intégration de WSL
    - Ouvrez une console powershell, et tapez "wsl -l -v". Si votre "Ubuntu" utilise la version 1, tapez la ligne de commande suivante "wsl --set-version Ubuntu 2" (L'opération dure quelques minutes)
    - À partir de la barre d'état système (system tray), sélectionnez l'icône de docker en faisant un clic droit, puis choisissez "Settings".
    - Une fois le panneau de configuration de docker ouvert, sélectionnez "Ressources" puis "WSL Integration". Si l'option "Ubuntu" n'est pas activée, activez la et cliquez sur "Apply & Restart"
    - Une fois appliquée, retestez
- Sous Linux lancez un terminal
  - Testez la commande "docker". Si le programme ne se lance pas installez le package docker

Si aucun message d'erreur ne s'affiche, vous pouvez débuter l'exercice 1.

<details>
    <summary>Installation de docker</summary>

```bash
apt install docker
```

</details>

## Exercice 1 - Hello world docker !

- À partir d'un terminal ouvert précédemment, vous allez lancer votre premier conteneur à partir de l'image docker "hello-world" :
  - Faites un "docker image ls". Que constatez-vous ?
  - Tapez la ligne de commande "docker run hello-world"
  - Recherchez la signification des dernières lignes sur la documentation en ligne de docker
- Faites un "docker ps". Voyez-vous quelque chose ?
- Faites un "docker ps -a". Que constatez-vous ?
- Affichez la liste des couches de commandes qui ont été appliquées à l'image "hello-world" :
  - Cherchez la bonne commande dans la documentation de docker dans la section "image"
  - Vous devriez avoir un affichage similaire au suivant :

```bash
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
bf756fb1ae65        8 months ago        /bin/sh -c #(nop)  CMD ["/hello"]               0B                  
<missing>           8 months ago        /bin/sh -c #(nop) COPY file:7bf12aab75c3867a…   13.3kB        
```

- Toujours à partir de l'option image de la commande docker et de la documentation, cherchez comment supprimer l'image hello-world. Vous devriez rencontrer une erreur pourquoi ?
- À partir de l'affichage obtenu à partir de la commande "docker ps -a", cherchez la suite de commandes à exécuter pour supprimer le conteneur et l'image
- Validez que l'image n'est plus présente

<details>
    <summary>Affichage de la liste des couches</summary>

```bash
docker image history hello-world
```

</details>

## Exercice 2 - Créez le programme hello-world

- Sous Windows : utilisez le terminal Windows, lancez une console Ubuntu ; sous Linux lancez un terminal
- Vérifiez si le programme g++ est installé (g++ --help)
- S'il n'est pas installé, l'installer (package g++)
- Créez le fichier "premier-programme.cpp" avec le contenu suivant :

```cpp
#include <iostream>

int main(int argc, char** argv) {
    std::cout << "Bonjour à tous" << std::endl;
}
```

- Pour compiler votre programme, utilisez la commande ```g++ premier-programme.cpp -o premier-programme -static ```
- Créez le fichier "Docker" avec le contenu suivant :
```dockerfile
FROM scratch

COPY premier-programme /
ENTRYPOINT ["/premier-programme"]

```

- À partir du fichier et de la documentation, décrivez ce que fait le fichier Dockerfile
- Tapez la commande ```docker build --tag premier-programme:latest .```
- Validez que l'image a bien été créée
- Lancez un conteneur qui utilise votre image
- Modifiez le programme précédent pour qu'il corresponde au listing suivant :

```cpp
#include <iostream>

int main(int argc, char** argv) {
    std::cout << argv[1] << std::endl;
}
```

- Modifiez votre Dockerfile afin que par défaut, le programme reçoive "!!Bonjour à tous !!" en paramètres
- Reconstruisez votre image de conteneur
- Essayez de lancer un nouveau conteneur en utilisant les mêmes lignes de commandes que précédemment
- Essayez de lancer un nouveau conteneur en utilisant en ajoutant à la fin la chaîne de caractères ```"Un paramètre qui vient de l'extérieur du conteneur" ```

<details>
    <summary>Installation de g++</summary>

```bash
apt install g++
```

</details>

## Exercice 3 - Programme C#

- À partir d'un terminal, placez-vous dans un nouveau répertoire "premier-conteneur-csharp"
- À partir du programme dotnet, créez un projet .Net core de type console
- Testez manuellement votre programme

<details>
    <summary>Création et compilation du programme en local</summary>

```bash
dotnet new console -o premier-conteneur-csharp
cd premier-conteneur-csharp
dotnet run
```

</details>

- Pour compiler votre programme, nous allons utiliser ici une image docker contenant le SDK de dotnet 3.1. Nous allons ensuite copier le résultat dans une nouvelle image qui ne contient que l'environnement d'exécution de dotnet core 3.1. Pour cela, placez vous dans le répertoire du projet et créez le fichier Dockerfile suivant :

```Dockerfile 
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["./premier-conteneur-csharp"]

```

- Créez l'image docker "premier-programme-csharp"
- Testez votre image
- Essayez de comprendre les lignes du fichier Dockerfile en cherchant dans la documentation
