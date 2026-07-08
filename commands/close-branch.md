---
name: close-branch
description: Rituel de cloture propre d'une branche de travail. Verifie qu'elle est 100% mergee dans la branche principale, puis commit+push l'etat restant, supprime la branche locale et le worktree, et remet le repo principal sur la branche principale a jour. REFUSE de supprimer une branche non mergee. A lancer en fin de phase (feature mergee, travail termine) au lieu d'un nettoyage manuel.
---

# /close-branch : Cloture propre d'une branche de travail

Tu executes un rituel de fin de phase : ne plus laisser du travail dormir dans une branche/worktree oublie, ni supprimer par erreur du travail non merge.

**Garde-fou absolu : tu ne supprimes JAMAIS une branche qui n'est pas 100% mergee dans la branche principale.** En cas de doute, tu t'arretes et tu demandes.

## Etape 0 : Situer le contexte

```bash
git rev-parse --show-toplevel      # racine du worktree courant
git branch --show-current          # branche courante
git worktree list                  # suis-je dans un worktree lie ?
```

- Identifie la branche principale : `main` si elle existe, sinon `master`.
- Si la branche courante EST deja la branche principale : il n'y a rien a clore. Dis-le et arrete-toi.
- Repere si le dossier courant est un worktree lie (different de la racine du repo principal), tu en auras besoin a l'etape 4.

## Etape 1 : Verifier que la branche est 100% mergee dans la branche principale

C'est la verification qui conditionne tout le reste.

```bash
git branch --merged main           # adapte main/master ; la branche doit apparaitre
```

- Liste les branches deja mergees avec `git branch --merged main` (adapte `main`/`master`).
- **Si la branche courante N'APPARAIT PAS dans cette liste → elle n'est pas mergee.** STOP.

### Si NON mergee → REFUSER

Ne supprime rien. Explique clairement :
- « La branche `<branche>` n'est pas mergee dans `<principale>` : elle contient du travail qui serait perdu. »
- Propose les vraies sorties : (a) ouvrir/finir une PR et la merger d'abord, puis relancer `/close-branch` ; (b) si le travail est a jeter volontairement, il faut une suppression forcee EXPLICITE (`git branch -D`) que seul l'utilisateur decide, tu ne la fais pas de ta propre initiative.
- Termine sans rien detruire.

## Etape 2 : (mergee) Commit + push l'etat restant

Seulement si l'etape 1 confirme que la branche est mergee.

```bash
git status --porcelain             # reste-t-il des changements ?
```

- S'il reste des changements non commits : commit (Conventional Commits, message en anglais) puis `git push`.
- Si rien a committer et rien a pusher : passe directement a l'etape suivante.
- Rappel : jamais de push direct sur la branche principale.

## Etape 3 : Remettre le repo principal sur la branche principale a jour

```bash
git checkout main
git pull
```

- Bascule sur la branche principale et mets-la a jour (`git pull`).
- Verifie que le pull a reussi (lis la sortie, pas juste le code retour).

## Etape 4 : Supprimer la branche locale + le worktree

```bash
git worktree remove <chemin-du-worktree>   # si applicable
git branch -d <branche>                     # -d refuse si non mergee : ceinture de securite
```

- Si le travail se faisait dans un **worktree lie** : `git worktree remove` d'abord (depuis le repo principal), puis supprime la branche.
- Supprime la branche locale avec `git branch -d` (le `-d` minuscule REFUSE la suppression si non mergee, c'est voulu, ne le remplace jamais par `-D` sans accord explicite de l'utilisateur).
- Si `git branch -d` echoue en disant que la branche n'est pas mergee alors que l'etape 1 disait l'inverse : STOP et signale l'incoherence, ne force pas.

## Etape 5 : Preuve

Montre l'etat final :

```bash
git branch --show-current          # doit etre la branche principale
git status                         # doit etre clean, a jour
git worktree list                  # le worktree clos ne doit plus apparaitre
```

Resume en une ligne : branche supprimee, worktree retire, repo principal sur `<principale>` a jour.
