# Module 17 - Kubernetes - Manisfeste et Services

Dans les exercices qui le permettent, assurez-vous de toujours indiquer un espace de nom qui correspond à votre numéro de matricule. Pour vous aider, ne sautez pas l'exercice 2.

## Exercice 1 - Amélioration de votre bash (bash seulement)

- Ouvrez un terminal avec bash et tapez la commande suivante et relancez un nouveau bash :

```bash
echo "source <(kubectl completion bash)" >> ~/.bashrc # ajoute l'auto-complétion de manière permanente à votre shell bash
```

(Source : https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/)

## Exercice 2 - Ajout du cluster distant et modification du contexte

!!! Si vous êtes sous windows, ne passez pas par le Ubuntu de Windows mais par powershell !!!

- Faites une copie de sauvegarde de votre fichier .kube/config 
- Éditez le fichier et ajoutez une configuration dans propriété cluster avec le nom "kubernetes-distant" :

```yaml
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1EZ3lNVEV6TWpBMU1Gb1hEVE14TURneE9URXpNakExTUZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTVY1CndHNkkweitKVmVKcVVVZXJZNkJuWjF3VUdGbndObzlNTVZqSTBaQ21oWEtiKzhTUDNXR1h3Y09mVU10SngzY00KckFaUFJrZERRY3JWbjkrWDNoakwyRTlHcEg3a3FQeWhud3JKQlBzWWVLQld5dkUzYVhJdUcwZkw5TmovQzRERQpDVFZrQXV2TjZiZVViTFBoM2lZNjJBcjFKWVhtSTRDak13TmQyZ0lNemRTTUl1OGFwaXFTMkMrd0psL3kvRUNvCmtsL1dMMERuWmFRdkhlaWozU3JZQ3NpNTNnMEpTNUU2VFdXWG85MkJheTFRTVVSS01IQkJic1RYUGdqZ0U5ZVQKNVk2WE5lZnRQRlVKa1QxUnJIcnRRcW51Zy84STBUdm9YditMbHNXa1FpZ210UHVDcjBIV2JaVCtXeXdkL3ZBZQpOSG5NYWhMWHVYdEFCdEVEY3Q4Q0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZOb0RMd1NOajBWcG1VWHVLV0xrSWFmd3BaZWpNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBYXpaRGp5aHpNWTRlcEF6TDdCUzJzZndCcnNiQ2ZHVWhXTnZ4VXZWdkNzT29PeUJhKwpjeTJobFd1ZmtVMVAwNks5SUY3cW1jZ0NpdklVZmFkTHRmNEVEb3VuWW4vSFhLRGdHaVRsd0swYUhuUmZaNXU5CkFZcElocVUrMW9GWTUyRTNyR3ljc2pOQzJGd1R0ZVhSazN0OVNybEdhbXhrT09xTE1sVFVoV0dMSDNIbEZyM1AKb1hNaTlWRWQzUWZpQjVUbm5uY1BZeFEvTU0yWVpWRE9kWWgxaTRicUhDeVl5RWx6UmtmTU04U1lZbStmaVRTVgpQMjJEVVhPazg5bFl2MkpjZkRYWkdJQy9PdHR1eXFqdi9wbzV5ZVkzdFI2OHdIOVMySUp3WW5LK2ozc09IVnplCmxELzVWV2NlQ1VOeEkwSWZLZThMRmxlR0JTWGdRRGVKUGF2cAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://10.100.2.90:6443
  name: kubernetes-distant
```

- Ajoutez l'utilisateur "kubernetes-distant-admin" :

```yaml
- name: kubernetes-distant-admin
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJSXdGa1RPVmRFL0V3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TVRBNE1qRXhNekl3TlRCYUZ3MHlNakE0TWpFeE16SXdOVE5hTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQW5oVnQvZXRNR0hoOFpnVHoKczliVjFlZlRsMExUSEFFZkkzVXV2YTdwNmpWa0dkSVliK3VzTEZZdWdsbDlCc2J5VWptODlWZFpGaFFpLzBldApFL2ludS80S2RTWFdDOWhSbzFNWnBqZ1JIRnFkL2dxY2lLUWVkajJGZnlIZ0FDWHZVQ0RmYlRteUFwNExEVzlCCllIaWFuanpkaTFSWHZWbFQzSm9objRzSUFvNktLRlpMT0d3Y3l2RDFwbmozQ2dTYVQ1aG9YMS9ldE12YkFLQnQKcHdQelhGWk92NWpCRmZzdE1mT1psU0Y0d0NhNW9GYXZPVkNRSmVhK2JNcGJUb2hvR1NoRndyUnh2Y1U4SGVlRwowaXZ2clZXclN4M011TVBnN0lwLzJaTzBSeHhSa2FyOWtWSW9FVXJTbCsvL3Q1RVVHTG1tVGRjSVNjc010eFhXCmJXeDlEd0lEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVUyZ012QkkyUFJXbVpSZTRwWXVRaHAvQ2xsNk13RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFJV1orVm5jcmt0YmwzVXk4eWZLWm9UOWVDV1R6clV5SkRJb1ZRWWM3MmxQMWFSRjF6MDB5bFJXCm1DN01YcGZBSGsvUHNGS3J3WVZZK3N6bm4yNWQ4L000Wk1takJkT214MnFIdjhDZ1AyMS9nMlpjVk52b1hzTkgKcm9jcmhla21OR3NSSGhDRGZGWWJHYTJadTNVVVdxTkFkZEI0NnpLaHZnUVpaUGhHWUlRc0d1TnMvZzNLSmdKbQpVeG4vR1haUFV5R2dHRnluM3dZeTFlWmxod05IaWNpQXc4MDhYcUZ2ZzBEM2JNY2JZOVNxY0JtNWVtZTdWSE4vCkR2Q0c1NHBhVEdycnZLeVM2KzZMVGZKSzA2MXdMMjNhNGpCdC9nZWZidUZlT2pnTVpiQkpUbjZTckdia3l4OFcKMkdYR3NoMEE0bTJsVWRMYlVqaGF3aEtSTzFXcVJERT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb2dJQkFBS0NBUUVBbmhWdC9ldE1HSGg4WmdUenM5YlYxZWZUbDBMVEhBRWZJM1V1dmE3cDZqVmtHZElZCmIrdXNMRll1Z2xsOUJzYnlVam04OVZkWkZoUWkvMGV0RS9pbnUvNEtkU1hXQzloUm8xTVpwamdSSEZxZC9ncWMKaUtRZWRqMkZmeUhnQUNYdlVDRGZiVG15QXA0TERXOUJZSGlhbmp6ZGkxUlh2VmxUM0pvaG40c0lBbzZLS0ZaTApPR3djeXZEMXBuajNDZ1NhVDVob1gxL2V0TXZiQUtCdHB3UHpYRlpPdjVqQkZmc3RNZk9abFNGNHdDYTVvRmF2Ck9WQ1FKZWErYk1wYlRvaG9HU2hGd3JSeHZjVThIZWVHMGl2dnJWV3JTeDNNdU1QZzdJcC8yWk8wUnh4UmthcjkKa1ZJb0VVclNsKy8vdDVFVUdMbW1UZGNJU2NzTXR4WFdiV3g5RHdJREFRQUJBb0lCQUZLc1htT25CSnJmbUI4NgpnOEVQbjdGSWxrM0s4dUQ0YlRKNy9EL1RGQjRhWWdsbTZNVFBlYkdPT0xDTzRHWUU4WUd6RkhFeWh6S1d3VjdFCk8yM3dZcmhjT1ZmZXU3eGlHdi9SVzk2ai83N1dYVDRZaXBpalRCTUdSYVNoTUthak1DNjFvbU5iQXc5L1c4UmcKNU0zeEJOdXdkU1NDcllnbkNVYWJqTzRGSmVFL20rWHpNK3Znd3pTMnc0K29wbHFOUXg2b05kQ2ZMRllzUXJrWgpoWW1DaDRIZ0hRSFZSWmhlemEwZlBrcXl2dUQzVUVTckNlRExxL2ZBSlFmWXFDK2daQzJTODZOYWVmTVlQUXVuCktPMXFIL2Q3L21oS3VTVERWL1Jsd09uWEg1dDJPbnJaMDZyaUU3Q0ZiTkV5Q0VPN1l6SzR6ZTVib2dSOHMrWVMKeWJrQUlKRUNnWUVBeloraXpkcFF5N05wOFhIUFNJR2ZZMnZENkQ4ZmphVHhmTElnRkxZTGIvVnNnTVRXSTdYbwoxTkhXR1lHNHgzeW9qQmMzVURDTVYvYjhCL1J2bEROTGliZlZHdk0xUnFiRXE2b3I4NGJ2R3QzM21CczB0aHVjCkhSOGJvUVRNbUo4Z1kxQnJRcS92bFU0VmR5VEYzMVVnaCtXTkhFRTB1OWRVcWQ1TVh0T3ZNQ1VDZ1lFQXhOQXMKWDF6M1hlWG04dkxiZ0ZsZlBkSnVpc2txN3IzMHZqT0ZUVjhKWXRrZTJDcitqVkd5cWdlTnBjUVQvcUhJYWFYbQpMc3ljM2F6em5Ea3VxaEJmaXRDWHhUb1U1c2VTdUl3elNhU2k1VE5PVU5JdHBTRmpBVjJlL2dhUk9xM1Bzc3ExCnpLNkZobU9ZRngzbmtKcVV0T2dFeUgrUEFxS3AxTXFhODA2c3lDTUNnWUJKWGlSZy92ekZNZ2NqTjFDV3RtbUEKdC9yMjYwNys0MU9uQW9lZjNEVEloZkZwSU5LbmUwalFadTdWdXd1TFlsZGhaUWMvZlpNVjcvS05oQklyOXdHRQo2aXNIcXEvZnZiRis3d0V2cTMyMVFHNFB2K1ZXOVJNRzhRcVNzWHV2R1ZnZEY1eXQ5c2l0cFdiVFZET21OR0dmCkc3RDEyKzVNOTlBbHJFUGpzZlJZWVFLQmdEVVNEV1VKcElwbFhBbFhBMmx3c0FYem9HczhJNStOQ1ZuZ2VxbUsKWHZXUXBvaVR6MkE4RDNsWjRCQTY5MGxLUnNoMk84T1MyUm5OY1VOSENCWkRvLy9DajZwWEp4dXo1UlJ1ZWNYNQo1eEwyNnI5UWJZNkJtampjRGV0aHlmZVF0dGozWUY1NUVQaFVFc2JwQVhBMHZyU3BlK0MweE5OcEdYS1B6NGljClJtc1JBb0dBZmJrSEcvMzBIYnFNQmRucmpsRGpqZ1Nsc0UyVC9nejhWMmxBTGJNbzhKU1BTN1ZTUTRwOHVFTTUKdkQxcitrYlV4TEJjdjFJcEFBY0FjTHVaVTdOWmRiSTdreWZSN2dGczF6QzhUZGd3Q0wzLzdUZTNsNW1mNnZNQQphS0laVGVKN3d2aklKQ3o4Z1d4RVo2WGFWck1lSmRibVdONG5nY2hIdmdzVkNKRVJLODg9Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==
```

- Créez vous un contexte avec la commande 'kubectl config set-context', spécifiez un nom de namespace qui correspond à votre numéro de matricule, le cluster et l'utilisateur que vous venez de spécifier  (Voir démonstration)
- Définissez votre nouveau context comme étant le contexte courant (use-context, voir démonstration)
- Affichez les noeuds et les pods du cluster (tous les namespaces) et de votre namespace pour valider que tout fonctionne
- Créez un fichier manifeste afin de créer votre espace de noms et appliques le. Attention, étant donné que vous utilisez votre numéro de matricule comme nom, il faut le mettre entre guillemets sinon YAML va le prendre pour un entier et non une chaîne de caractères.
- Validez que l'espace de noms existe bien

## Exercice 3 - Créez plusieurs déploiements - Sélection

- Créez plusieurs déploiements avec les caractéristiques suivantes (un réplica) :
  - dep1.yaml :
    - image : nginxdemos/hello
    - replica : 1
    - labels :
      - tier : frontend
      - env : unit
  - dep2.yaml :
    - image : nginxdemos/hello
    - replica : 1
    - labels :
      - tier : backend
      - env : unit
  - dep3.yaml :
    - image : nginxdemos/hello
    - replica : 1
    - labels :
      - tier : frontend
      - env : fonc
  - dep4.yaml :
    - image : nginxdemos/hello
    - replica : 1
    - labels :
      - tier : backend
      - env : fonc
  - dep5.yaml :
    - image : nginxdemos/hello
    - replica : 1
    - labels :
      - tier : frontend
      - env : accept
  - dep6.yaml :
    - image : nginxdemos/hello
    - replica : 1
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
    - port : 80
    - ne spécifiez pas de port pour le node et ne créez donc pas de propriété nodePort
    - type : nodePort
    - matchLabels : voir exercice précédent
- À partir d'un pod qui a un shell, essayez la commande suivante :

```bash
watch -n 1 wget -qO - mon-site | grep -o -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
```

- Cherchez le port d'exposition sur le noeud en affichant la liste des services
- À partir de votre VM, naviguez l'adresse IP suivie du port

## Exercice 6 - Livre d'or

- Suivez les instructions du site https://kubernetes.io/docs/tutorials/stateless-application/guestbook/ afin de créer un livre d'or avec un site PHP et le serveur de cache redis
