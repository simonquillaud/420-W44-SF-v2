# Voici une liste des commandes de base de Docker 


## Commandes de gestion  :
```bash
docker container ls                       # List all running containers
docker container ls -a                    # List all containers, even those not running
docker container stop <hash>              # Gracefully stop the specified container
docker stop $(docker ps -a -q)
docker container kill <hash>              # Force shutdown of the specified container
docker container rm <hash>                # Remove specified container from this machine
docker container rm $(docker container ls -a -q)   # Remove all containers
docker image ls -a                        # List all images on this machine
docker image rm <image id>                # Remove specified image from this machine
docker image rm $(docker image ls -a -q)  # Remove all images from this machine
docker login                              # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag      # Upload tagged image to registry
docker run username/repository:tag       # Run image from a registry

```


## Création d'images
```bash
docker build -t vieux/apache:2.0 .
docker build -t friendlyhello .             # Create image using this directory's Dockerfile
docker build -f /path/to/a/AutreFichier .   # Utilisez une autre fichier que Dockerfile.
```

## Démarrer les conteneurs : 

```bash
docker run --name test1 -it busybox
docker run -p 4000:80 friendlyhello          # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello        # Same thing, but in detached mode
docker run -p 3307:3306 -e MYSQL_ROOT_PASSWORD=Passw0rd -d --name MonMySQL  mysql:latest
# Autre exemple avec mappage et nom de conteneur.
```

## Utilisation d'un volume :

```bash
# Volume sur Linux
docker run \
    -v /tmp/volumeNginx:/usr/share/nginx/html \
    -p 11234:80 --name monNginxLinux nginx
# Volume sur Windows
docker run \
    -v d:\\DockerVolume\\VolumeNginx:/usr/share/nginx/html \
    -p 1234:80 --name monNginxWin nginx

docker run -v d:\\DockerVolume\\VolumeMySQL:/var/lib/mysql \
    -d --rm --name MonMysql -e MYSQL_ROOT_PASSWORD=Passw0rd \
    -p 3307:3306 mysql

#En lecture seule
docker run \
    -v /tmp/volumeNginx:/usr/share/nginx/html:ro \
    -p 1234:80 --name monNginxLinux nginx
```

## Création de WordPress :
```bash
docker run -d --rm --name mysql \
    -e MYSQL_ROOT_PASSWORD=Passw0rd -e MYSQL_DATABASE=wordpress \
    -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=Passw0rd \
    -p 3306:3306 -v /Users/pfl/tmp/msyql:/var/lib/mysql mysql

docker run --rm --name wordpress -d \
    -e WORDPRESS_DB_HOST=172.17.0.2 -e WORDPRESS_DB_USER=wordpress \
    -e WORDPRESS_DB_PASSWORD=Passw0rd -e WORDPRESS_DB_NAME=wordpress \
    -e WORDPRESS_TABLE_PREFIX=wp_ -p 8080:80 wordpress
```

# Docker-Compose