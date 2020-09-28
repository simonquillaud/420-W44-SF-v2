# Module 17 - Kubernetes - Manisfeste et Services

Dans les exercices qui le permettent, assurez-vous de toujours indiquer un espace de nom qui correspond à votre numéro de matricule. Pour vous aider, ne sautez pas l'exercice 2.

## Exercice 1 - Amélioration de votre bash (bash seulement)

- Ouvrez un terminal avec bash et tapez la commande suivante et relancez un nouveau bash :

```bash
echo "source <(kubectl completion bash)" >> ~/.bashrc # ajoute l'auto-complétion de manière permanente à votre shell bash
```

(Source : https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/)

## Exercice 2 - Ajout du cluster distant et modification du contexte

- Faites une copie de sauvegarde de votre fichier .kube/config 
- Éditez le fichier et ajoutez une configuration dans propriété cluster avec le nom "kubernetes-distant" :

```yaml
  - cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01Ea3lNekF5TkRFeU1sb1hEVE13TURreU1UQXlOREV5TWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTlErCnlzMUU5aGdYWGxxSGJiMVdVOGhGTFRVc01EbVhZdDNZeHM2UG14Z3VFQThjTDZNMGtvQm1VQUhSV0ZXWHN1bm0KOTZoSGJXbmtUZHBwdmdSNkl5RjRjd2pFVzlpVWlCZFdTeWlHcUNxV240ZnU4Qk5sbDBEQlU2aUdmYm11TG5nMwpmeHcvWU5RK2toTWhkRUZ3V2xzc3BuNitGTHBEcFB1anRNUG4xWitnVnBrNllSNitoSFZMTnNvYXpXRkhXd0ovClFJNXA3bDQvNkMxdXZNbUxJc0I3WXJmUWVKUmQvUTFFbkNOQnczYmh1cGJhVGJYbUdmUlhpZ0g2QVdSQ0N2U1cKY09VMlNicjFkeGZ6NThDclc4dS9QekxuVGt6Qm1KN2hmYkZpMmV6RkhtazBtdDB1TUtRSkpsY0RzenluL0orYwp3VklDdW9FWm5xd1lDc0l6Z2ZFQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZMV0x3Z2xGSWtWQmlTcTIxRHFOenRsRnhlZStNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBRngvS3dDU1B1c3RJTjBYSjhiTHNSZmI0ZU9TRUprNkdVNlE4MGIwU0lVSHVZY0hiSgpHMXJLL3AzbWRhaXlFTU0wVjV2Z0IvRlRUNkxTaUVyZE52S0UvSG1mVEF0MnQ3ZlNqSjk0aVJYUGwwR3B0MVVXCjFRenptSmROU1pRRW1wd1NHRnpTTXlETHd6bThXWjNEaGx1eGhPbDF0R1YvVUw2M09LRWJKTER0N3MyZkVhMHUKcUs5QWEwMXRXVmJjRVJKbkNuMTF3V0V4WFJ5YmcrUi9jcTNheml5MktLRVd6N0pDTDZHOHd4bkR2bEVMc0dFZQpOdnlianpqS3M1ZFZ1dnd1MnZnOUxtRVlPYU9KUWNzbDEvc1hDSXVucUpHMnhhdUJHVkFxTm5zWWJWVUpPcUZOCnYvTVNrbm5wRmYxSm9YaXRod2pnZGpRemEvZFRabTBlbk9iRAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://10.100.1.6:6443
  name: kubernetes-distant
```

- Ajoutez l'utilisateur "kubernetes-distant-admin" :

```yaml
- name: kubernetes-distant-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJSkw1ZHVzMGFvVHN3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TURBNU1qTXdNalF4TWpKYUZ3MHlNVEE1TWpNd01qUXhNalZhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQW1KM1NkZ1RUSDc1ZktLU1MKWkdvcDEyVGNrZHdobEMyT3R1SnZjNi9ySXZjeHEzMUh1NjdNZkJFZVQzdVUvcUlHb1l2RGdNdk8yOUVVTHp6VgpPNUE0TzNEc1MvSmg2RUtHNDFkNmJ1RXZNSU9KSWdMYndmbUtPUE9ZQzE2MnY1R1pmMFFKeUk4KzNPUmpMaUhmClJLbjBlSytQL2J0aTZVbFdXT1hkQW4zaklHNE94SElHbGpwcWErMEFhMTcyNkVEK01sRU15aVBGT2VxUnB6STkKQnFZZThTOWtja1EzNmJRVE01d2I2U3BPeHZ2d2krVnF0bU9ZVXQ1SXJvWjFlQ0ZUanlRaVlydzlmRmxQSWN5bQowOTBDQUwxNzVNMVhEZ1BzMjY0YnUrQUhXK3BjRldBRjQyMnI0V1hXcktOVjJUTkRCeE1DYngvTjRwVlpwd0F4CjY5MnZvUUlEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVV0WXZDQ1VVaVJVR0pLcmJVT28zTzJVWEY1NzR3RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFINlFLSVQ2UzVySDZibjY0TjZHZ1ZMek5vTjNGclpDTnNRRHpHQ20xcDkvcDJPaUd1SWYvdW1BCmN2bFh0M2ZzamlkVWtUaDN0WVJ2R2NVMzRzL1kxbXE4TlNRVnNhSXE0aTBmMG43UUw5TmhSazlhR1FIRlFzUHIKZkErL3hwcTFmNTZjbkJySTU3am12R3lXVVpDMnB5bVhFcWFqb2dPTnU4VFozK2kyVHp2bGUrem95RXNNd2FuVQpsNE9UZHVzMEhsaHA0eUFrR2t6WnJuWGxUTnA5ODQ3UFZTQTgvcW5sWXRjSHN5YTFoRU5TQzUyTEs1Wk9DWG15Cml3Ni9Ud0RrOWdZZVUySHgwOUVVb1p3NW9PcS9acFB2K1JqOVNEVnhyNXFzdmN1WjNEVXJFNmJRaXg4dEFWSHQKZUVielJOcXpycCtMTjRrWEU3OGpETmR3OEZhaHZrMD0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBbUozU2RnVFRINzVmS0tTU1pHb3AxMlRja2R3aGxDMk90dUp2YzYvckl2Y3hxMzFICnU2N01mQkVlVDN1VS9xSUdvWXZEZ012TzI5RVVMenpWTzVBNE8zRHNTL0poNkVLRzQxZDZidUV2TUlPSklnTGIKd2ZtS09QT1lDMTYydjVHWmYwUUp5STgrM09SakxpSGZSS24wZUsrUC9idGk2VWxXV09YZEFuM2pJRzRPeEhJRwpsanBxYSswQWExNzI2RUQrTWxFTXlpUEZPZXFScHpJOUJxWWU4UzlrY2tRMzZiUVRNNXdiNlNwT3h2dndpK1ZxCnRtT1lVdDVJcm9aMWVDRlRqeVFpWXJ3OWZGbFBJY3ltMDkwQ0FMMTc1TTFYRGdQczI2NGJ1K0FIVytwY0ZXQUYKNDIycjRXWFdyS05WMlROREJ4TUNieC9ONHBWWnB3QXg2OTJ2b1FJREFRQUJBb0lCQUhSM3pNdGdOelo4YytaeQpZWDNjUHY0djdOd3JZRHpTMzV6V0JUUUdScTJ5YytkcGZqck8xU0xCZFo0MnM2ZjNRcFE2TXdLeGhyWGVRMGNoClo2RkRHSWJVVUtCTTQwYjZyaklFNmx4LzRTRm00RnBpVUE4aVBzZmpybDdPOHl3VEUwODZQelVkakYzS3RaM1oKSDZncEEzYXVsSGFRY0pXVDhCOTduRVJ3aWNxT3hWb2JLejBNVmVJZ1VtajZlNG5XZ2p6WTk1ZkxQbGR5OXpPSApKYVNTMktRSVVTRWVVaWF4VWhUOXV0Wno3TG1IN0lma24rSmV3dWJnWXUvQUVVcDFVa3RjTUFFVmQxQ1ZxbW1pCkNUbzJraVJYVzMwTTNPY1phdlJPMG04azdyR0JMTmYvWEluRFA5OHJKWmRoZWZweFFIemhldHJkR1hJNnpwN04KbEY4MFNsa0NnWUVBd2NTRHRPcm82RWZKMmVjN1ZwNEorbVdISCtvQ3hzNkd4RzVWcDgzQXgvemtJTDBxQytkZgp5QUs2L2F0VmsvN1FkYXJhYkNSOFduQWdncXhIQysvRTZyRWU1Mi9KZWpUVndCLzlMQ1J1Umx6NlpjOTQ5djV6Ck02ZGJsZjNQMHM1MnBVUHhNME4xRjdScm1wNll0VHdGMFNQSUZ3RDNXRldIL1FOZ3lYMitJUnNDZ1lFQXlhSGgKTldkRG5KOU1tUTJFVld5U0N3VTY2NmRFZnRuY3dBT0JBWGliK1dIalNrcjB5aVdycWVjK24vOEs4SCs2ZzA0Zgp1Y3F5RXVRLzh5ZGlCTWF1ZDNaQkh1bko3TUtNaXE0cnVMM1R0ZElCZU9QYUNxN3MxaitnRXoyQ05QTVdRZTlMCkoySHgvNHBsZHZUa3hoVVJpejZicVVsVE45V3hqNmNjem9xaitmTUNnWUIreitqT242cmNVaGRWcDlLYTVvVnIKUGNVSWF2TjBQemZPR05Pd0phVlVmVHFqL29rbEQwRU5PbFE4cmtRc3ZtaVppYjYzWmMySXRyZGdMZlcxWnk4OQoxYnQvQmhjYkJyY1pyUlhaTE9LSzVGRHdEcStCSHBnd3B3ZjJpd3pYVDA0dzdOMVBpb2Q0Z3hpbE1jU0pZQVlDCmtPTmp3cnNlTWFQMVA1KzVYclR2SHdLQmdRQ1E0eDhHbGVhU3hERnhoYklEQkZwSlN2L1UyRVF5OXZCV2xlMzgKbGFOVzUwMUJWRzFrV1A5cXZuMVUwUnNXU0dKSStqbDM4enhVc09sM0cyU20wL0lJYTlSTmwyZC9GeW1RZWFsMwpQZ2pFalZ4N2R4ZDJOODUrQWdoUDZ4SUdaR3NwQS8rNEUveW1TTmV5VERXY1ZRVmZUcVRpVjR0U0F0OXR2NExHCnMvOHltd0tCZ0QyWDZ3RGkwcEJKN0k2MXp0NWlBbklvK1p2ZGRCTlBQV2xTWXBjQmFra21xQ1JoeTFvUmtSaWkKR1B6VTVkZXlaeHdTNitZdmRKaFlxclB0QlN5WGkxM1JZVU9VZGQ2dGF5bTg4YStkVHlJRjZRaEcxa1JlVkxXcgpxOWN6NGFIQzVaWFkwSFcrQnRYTExDeVk5dkxTVE42TW14V3IyQXFoUGNwOHo3VGh4ZHYyCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==
```

- Créez vous un contexte avec la commande 'kubectl config set-context', spécifiez un nom de namespace qui correspond à votre numéro de matricule, le cluster et l'utilisateur que vous venez de spécifier  (Voir démonstration)
- Définissez votre nouveau context comme étant le contexte courant (use-context, voir démonstration)
- Affichez les noeuds et les pods du cluster (tous les namespaces) et de votre namespace pour valider que tout fonctionne
- Créez un fichier manifeste afin de créer votre espace de noms et appliques le
- Validez que l'espace de noms existe bien

## Exercice 3 - Créez plusieurs déploiements - Sélection

- Créez plusieurs déploiements avec les caractéristiques suivantes (un réplica) :
  - dep1.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : frontend
      - env : unit
  - dep2.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : backend
      - env : unit
  - dep3.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : frontend
      - env : fonc
  - dep4.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : backend
      - env : fonc
  - dep5.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : frontend
      - env : accept
  - dep6.yaml :
    - image : nginx-demos/hello
    - labels :
      - tier : backend
      - env : accept
  - Faites des requêtes à partir de kubectl afin d'afficher :
    - tous les pods du tier backend appartenant à l'environnement fonc
    - tous les pods du tier frontend appartenant n'appartenant pas à l'environnement fonc
    - tous les pods du tier backend appartenant aux environnements (fonc, unit)
    - tous les pods du tier backend
    - tous les pods de l'environnement unit
- Supprimez tous vos déploiements

## Exercice 4 - Réplica

- Créez un déploiement avec les caractéristiques suivantes :
  - rep1.yaml :
    - réplica : 1
    - image : nginx-demos/hello
    - labels :
      - tier : frontend
      - env : unit
- Affichez les pods, vous devriez voir une seule réplique de votre pod
- Rentrez en mode intéractif dans un nouveau pod qui vous permet de faire des lignes de commandes comme l'image busybox.
- Avec wget / curl, affichez la page web de votre précédent déploiement avec l'adresse IP du pod
- À partir d'une autre fenêtre de commande, supprimez le pod (pas le déploiement !) qui contient votre nginx-demos/hello.
- Listez les pods et regardez ce qui se passe
- À partir de la précédente fenêtre faites de nouveau des requêtes au service web. Que s'est-il passé ? (une différence dans l'adresse IP ?)
- Faites une mise à l'échelle (scale) pour passer d'un réplica à 10.
- Affichez les pods avec une vue enrichie (wide)
- Dans le pod qui contient votre shell, essayez différentes adresses
- Amusez vous à supprimer des pods pour voir ce qui se passe

## Exercice 5 - Service

- Créez le déploiement d'un service qui vous permet d'accéder à vos 10 réplica :
  - service :
    - nom : mon-site
    - ne spécifiez pas de port et ne créez donc pas de propriété nodePort
    - type : nodePort
    - matchLabels : voir exercice précédent
- À partir d'un pod qui a un shell, essayez la commande suivante :

```bash
watch -n 1 wget -qO - mon-site | grep -o -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
```

- Cherchez le port d'exposition sur le noeud en affichant la liste des services
- À partir de votre VM, naviguez l'adresse IP suivie du port
