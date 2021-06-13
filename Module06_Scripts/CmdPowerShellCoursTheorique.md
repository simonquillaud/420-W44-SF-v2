# **Commande PowerShell utilisées dans la partie théorique**


**Diapo 3**

```powershell
Pwsh –command Get-Date
Pwsh –NoExit –command Get-Date
pwsh – version
pwsh –WorkingDirectory C:\Windows
Pwsh /?
```


```powershell
# Télécharger l’aide 
Update-Help (attention d’être administrateur)
Update-Help -UICulture en-us (l’aide française provoque un erreur)
Get-Help Get-date –Online
Get-Help Get-date -Example
Get-Help about_if
```

**Diapo 4**

```powershell
Get-Date; Get-Item c:\Windows
```

Diapo 6**

```powershell
Get-Process
Get-Process | out-file  c:\ps\process.txt     
Get-Process | Select-Object name
Get-process | Select-Object name ?     (pour avoir plus d’une propriété.
Get-process | Select-Obect name | out-file  c:\ps\process.txt
clear-host
Get-Command 
Get-Command | out-host     (Pas nécessaire sauf si on veut des paramètre de la commande).
Get-Command | out-host -Paging
```

**Diapo 9**

```powershell
help *process*
Get-Help processes
Get-Command -Name *service*
Get-Service | Get-Member | Out-GridView

#One-liners
Get-Service |
    Where-Object CanPauseAndContinue -eq $true |
        Select-Object
```
**Diapo 10**

```powershell
# Créer un fichier avec valeur :
New-Item -Path D:\ -Name test.txt -value "PowerShell"

# Récupérer une propriété :

(Get-ChildItem C:\Users\).CreationTime
(Get-ChildItem C:\Users\).CreationTime.ToShortDateString() (propriété et méthode) 
Get-Item -Path D:\etatService.txt
(Get-Item -Path D:\etatService.txt).Length
```
**Diapo 12**

```powershell
Clear ou Clear-Host
Get-psprovider
Get-PSDrive
Set-Location D:
Get-Item {tabulation} affiche les fichiers et dossiers
New-item –itemtype –Name test.txt
Get-item test.txt
```

**Diapo 13**

```powershell
Get-Service | Where-Object -Property Status -eq "Running“
Get-Service | Where-Object -Property Status -eq “Stopped“| out-file  c:\ps\process.txt
Get-childItem c:\windows
Get-Childitem c:\windows | Where-Object –Property Length -lt 1MB
Get-Service | Group-Object –Property Status
```

**Diapo 14**

```powershell
Get-Service | ForEach-Object { if ($_.Status -eq "Stopped"){"Service arrêté :  " + $_.Name} }
Pour faire un Else
Get-Service | ForEach-Object { if ($_.Status -eq "Stopped"){"Service arrêté :  " + $_.Name} }

Get-Help about_if
Get-Service | ForEach-Object { if ($_.Status -eq "Stopped"){"Service arrêté :  " + $_.Name} else {"Service en marche :  " + $_.Name} } > d:\EtatDesServices.txt
```

**Diapo 16 Get-Member**

```powershell
Get-ChildItem | Get-Member -MemberType Method 
Get-ChildItem | Get-Member -MemberType Method  | Measure-Object
Get-ChildItem | Get-Member -MemberType Properties | Measure-Object
# Récupérer une propriété :
(Get-ChildItem C:\Users\).CreationTime
(Get-ChildItem C:\Users\).CreationTime.ToShortDateString() (propriété et méthode) 
Get-Item -Path D:\etatService.txt
```


```powershell
Get-ChildItem | Get-Member 
Get-ChildItem | Get-Member | Measure-Object

Get-Process | Get-Member -MemberType Method
Get-Process | Get-Member | Out-Host -Paging
Get-Process | Get-Member -MemberType Properties
Get-Process | Get-Member -MemberType Method
```





**Diapo 18**

```powershell
Clear-Host
$test = "PowerShell"
write-host $test

#1 Bonne façon de faire appel à la variable:
Write-Host " $test "  #Oui
Write-Host $test    #Oui
Write-Host '$test'  #On récupère selement son nom

**Diapo 19**

#2 - Construite une chaine (concaténation)
Write-Host "La variable test possède $test.Length caractères" #Non
Write-Host "La variable test possède "$test.Length "caractères"
Write-Host "La variable test possède $($test.Length) caractères" #Méthode recommandée

# Récupérer les prorpiétés et les méthodes:
$test  |Get-Member


Write-host $test.ToUpper()
$test.Replace('Power','Super')
$test.Length
Write-Host "La variable test possède : $($Test.Length) caractères"



$test.Replace("Power","Super" )
# Attention on a changé le contenu mais pas la variable.
# Preuve : 
Write-Host $test

# Mais ceci fait le travail : 
$test = $test.Replace("Power","Super" )
Write-Host $test


# Utilisation d'une propriétés : 
$test.Length

$Date = Get-Date
write-host $Date

# Here-String

$TextLong = @"


Ceci est un texte $Date

        sur 
        plusiers 

        ligne
"@

Write-Host $TextLong
```

**Diapo 19**

```powershell
$vitesse = 0
Write-Host "$vitesse"
$vitesse++
Write-Host $vitesse

$vitesse +=5
Write-Host $vitesse

$vitesse = 10
$vitesse --
write-host $vitesse
$vitesse -=3
write-host $vitesse
```

**Diapo 20**

```powershell
# Fonction simple 
function Recupere-DateCourte
{
    (Get-Date).ToShortDateString()
}
Recupere-DateCourte
# Avec paramètre
function envoiprocess-versfichier
{
    param([string]$chemin)
    Get-Process |Out-File $chemin
}
envoiprocess-versfichier  -chemin D:\PowerShell\process.txt
```

**Diapo 21**

```powershell
#Portée des variables dans powerShell
$ville = "Québec"
function test
{
    write-host $ville
    $pays = "Canada"
    write-host $ville $pays
 }

write-host $ville
test
write-host $pays
```

**Diapo 22**

```powershell
# Voici un exemple pour rediriger le résultat d'une commande, ici Dir, dans un fichier
Dir | Out-File "C:\MonFichierDir.txt"

#Exporter un résultat dans un fichier csv
Get-Process | Export-csv -path D:\Export.csv -NoTypeInformation

#Pour écrire dans le fichier on utilise ADD-content

ADD-content -path "C:\Fichier_de_test.txt" -value "Test d'écriture"
```



```powershell
Clear-Host

$EmplacementFichier = [string]

$EmplacementFichier = "./MonFichierALire.txt"
$MonFichier = Get-Content $emplacementFichier

foreach ($UneLigne in $MonFichier){
    Write-Host $UneLigne
}
```



```powershell
$valeur = 0..10
For($i=0 ; $i -lt 10 ; $i++) 
{ 
   Write-Output "La valeur est $($valeur[$i])" 
}
```



```powershell
# Réponse au Défi section 3 de l'exerice 
[string]$textLong  
[datetime]$date = get-date
# Utilisons le "Here-String" variable texte de plusieurs lignes
$textLong = 
@"
Voici comment faire plusieur répertoire
$Date
=====================================================
"@

# Ici on doit vérifier si le répertoire existe avant d'allez plus loing.
[string]$repertoire = "D:\PowerShell\Script"

if ((get-item $repertoire -ErrorAction SilentlyContinue).Exists)
{
    New-PSDrive -Name ps -PSProvider FileSystem -Root $repertoire
}    
else
{
    New-Item -ItemType Directory -Path $repertoire 
    New-PSDrive -Name ps -PSProvider FileSystem -Root $repertoire
}


 Write-Host $date
Write-Host $TextLong

for ($i=1;$i -lt 21 ; $i++) 
{    
    New-Item -Path ps: -Name "Projet$($i)"-ItemType Directory  
} 

# Par la suite vous pouvez supprimer avec :
# Remove-Item -Path $repertoire -Force