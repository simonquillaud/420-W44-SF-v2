# Exercice 7 - Administration système : gestion d'usager

- Évaluation : formative
- Durée estimée : 1 heures
- Système d'exploitation : Ubuntu 20.04 Lts Client et serveur


**Objectifs :**

- Effectuer des tâches de gestion du système d’exploitation.
- Création correcte des comptes et des groupes d’utilisateurs.
- Attribution correcte des droits d’accès.

## Création d'usagers

- Connectez-vous à votre serveur depuis votre station de travail.

- Créer les groupes suivants :

|Groupe | Membres |
|----------     | ----------    |
| users | tous les usagers du système |

- Créez les usagers du tableau suivants 
- Pour les login respectez la nomenclature première lettre du prénom et le nom. 
- Tous ces utilisateur doivent avoir comme groupe principale **users**


|Nom            | Répertoire    | Mot de passe  | Intérpréteur de commande |
|----------     | ----------    | ------------- |------------- |
| Éric Bédard   | /home/ebedard | S0l&il01      |/bin/bash
| Joanie Slyte  | /home/jslyte  | S0l&il01      |/bin/bash
| Raja Ayadi    | /home/rayadi  | S0l&il01      |/bin/sh
| Usager1       | aucun     | acun     | aucun  |

Exemple de création : 
```bash
$sudo adduser ebedard
```
- Au besoin créer les groupes suivants et  ajouter les bon usager au membres des groupes  :

|Groupe | Membres |
|----------     | ----------    |
| users | tous les usagers du système |
| admin | Vous et Raja Ayadi |
| cdrom | cdrom | tous les usagers du système |

- Modifier les mot de passe des utilisateurs **ebedard** et **jslyte** pour "Pa$$ord01"


## Création d’une structure de fichiers

- Créez la structure suivante : ![Structure à créer](https://github.com/jpduchesneauCegep/420-W44-SF/blob/main/Module04_AdminSysLinux/images/varExercice7.png)
