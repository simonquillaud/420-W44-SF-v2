# Commandes Git utiles pour le laboratoire 3
```Bash
$git init
$git commit -am "Commit initiale"
$git branch develop
$git switch -c <nouvelle-branch>
$ etc -- travailler sur la branche
$git log --oneline --decorate

# Branches

$git switch develop
$git merge <nouvelle-branch>
$git rebase <nouvelle-branch>  # généralement plus propre que merge quand les branches diverges.
# Attention, lisez la documentation sur git et les branche (ici-bas) avant d'utiliser cette commande.
# Deplus, Ne rebasez jamais des commits qui ont déjà été poussés sur un dépôt public.
$git branch -d <brance-a-supprimer> # SVP ne supprimer pas les branches
$git branch -vv # Voir le dernier commit de chaque branche
$git branch --merged # Pour voir quelles branches ont déjà été fusionnées dans votre branche courante
git branch --no-merged #qui contiennent des travaux qui n’ont pas encore été fusionnés
$git branch --move mauvais-nom-de-branche nom-de-branche-corrigé
$git push --set-upstream origin nom-de-branche-corrigé
$git push origin --delete mauvais-nom-de-branche

# Remiser votre travail
$git stash push # remiser votre travail sans commit
$git stash pop  # récupérer votre travail remisé.
```

## Références à lire : 

- [Git Cheatsheet ](https://ndpsoftware.com/git-cheatsheet.html#loc=local_repo;)pour bien comprendre les différents états de git
- [Les branches avec Git - Les branches en bref](https://git-scm.com/book/fr/v2/Les-branches-avec-Git-Les-branches-en-bref)
