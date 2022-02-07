# Installation du Module Azure dans PowerShell : 

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
# ou
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -AllowClobber

Connect-AzAccount
```
Une fenêtre du navigateur par défaut va s'ouvrir pour vous authentifier.