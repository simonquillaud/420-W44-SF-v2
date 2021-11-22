# Exercice - Administration système : gestion d'usager (solutionnaire)


- Évaluation : formative
- Durée estimée : 1 heure
- Système d'exploitation : Ubuntu 20.04 Lts Client et serveur



**Objectifs :**


- Effectuer des tâches de gestion du système d’exploitation.
- Création correcte des comptes et des groupes d’utilisateurs.
- Attribution correcte des droits d’accès.


## Création d'usagers


- Connectez-vous à votre serveur depuis votre station de travail.


- Créer les groupes suivants gr:


|Groupe | Membres |
|----------     | ----------    |
| users | tous les usagers du système |

<details>

```bash
$sudo groupadd users
groupadd: group 'users' already exists
```
</details>


- Créez les usagers du tableau suivant 
- Pour les login respectez la nomenclature première lettre du prénom et le nom. 
- Tous ces utilisateurs doivent avoir comme groupe principale **users**



|Nom            | Répertoire    | Mot de passe  | Interpréteur de commande |
|----------     | ----------    | ------------- |------------- |
| Éric Bédard   | /home/ebedard | S0l&il01      |/bin/bash
| Joanie Slyte  | /home/jslyte  | S0l&il01      |/bin/bash
| Raja Ayadi    | /home/rayadi  | S0l&il01      |/bin/sh
| Usager1       | aucun     | aucun     | aucun  |

<details>

```bash
$sudo adduser
groupadd: group 'users' already exists
```

</details>
```
- Au besoin créer les groupes suivants et  ajouter les bons usagers aux membres des groupes  :


|Groupe | Membres |
|----------     | ----------    |
| users | tous les usagers du système |
| admin | Vous et Raja Ayadi |
| cdrom | tous les usagers du système |
| rh | Eric Bédard et Joanie Slyte |


- Modifier les mots de passe des utilisateurs **ebedard** et **jslyte** pour "Pa$$ord01"



## Création d’une structure de fichiers


- Créez la structure suivante sur le serveur : 


![Structure à créer](https://github.com/jpduchesneauCegep/420-W44-SF/blob/main/Module04_AdminSysLinux/images/VarData.png)


- Modifiez les attributs de ces répertoires de la manière suivante :


1- DSTI :
   * Propriétaire : root 
   * Accessible en lecture, écriture et exécution pour le propriétaire
   * Accessible en lecture, écriture et exécution pour le groupe admin
   * Pas accessible pour les autres


2- RH :
   * Propriétaire : root 
   * Accessible en lecture, écriture et exécution pour le propriétaire
   * Accessible en lecture, écriture  pour le groupe rh
   * Pas accessible pour les autres


3- Users :
   * Propriétaire : root 
   * Groupe : users
   * Accessible en lecture, écriture et exécution pour le propriétaire
   * Accessible en lecture pour le groupe users
   * Accessible en lecture seule pour tous

## Utilisation de liens symboliques

- Pour tous les usagers, sauf root, créer un lien symbolique dans son répertoire personnel vers /var/data.
- La commande doit être faite à partir de votre usager principal sans avoir a vous déplacer dans l'arborescence.

**Fin de l'exercice**




# Corrigé :

$sudo useradd 