# Mémo

## Création d'un groupe de ressources pour un étudiant

```bash
etudiant="pfleon"
prefix="A22_4393_420W44_"
resource_group="${prefix}${etudiant}"
compte_etudiant="${etudiant}@csfoy.ca"
tag_session="session=A22"
tag_cohorte="cohorte=4393"
tag_cours="cours=420-W44-SF"
tag_module="module=M04"

az account set --subscription "DFC_dev"
az group create --name $resource_group --tags $tag_session $tag_cohorte $tag_cours $tag_module --location "Canada East"
az role assignment create --assignee $compte_etudiant --role "Contributor" --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/$resource_group
```


## Nettoyage des ressources

```bash
az group delete --resource-group $resource_group --yes
```
