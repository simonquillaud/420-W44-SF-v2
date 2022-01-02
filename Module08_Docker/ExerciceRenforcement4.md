# Docker - Exercice 4 : Exercice de renforcement DOTNET


## Exercice 1 - Busybox

### Exercice 1.1 - Réseau par défaut (bridge)


## Exercice 4 - Application MVC core

### Exercice 4.1 - Création d'un projet MVC en .Net core



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

-