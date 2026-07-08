# 08. La discipline git

Git est ton filet de sécurité et ta mémoire d'état. Avec un agent qui produit beaucoup et vite, la discipline git n'est pas du zèle : c'est ce qui rend chaque changement annulable et chaque état lisible.

## Les règles de base

- **Jamais de travail direct sur `main`.** Une branche par sujet : `feat/nom`, `fix/nom`, `refactor/nom`, `chore/nom`. Pourquoi : `main` reste toujours déployable, et chaque sujet reste annulable sans toucher au reste.
- **Conventional Commits, en anglais** : `feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`. Un commit = un changement logique, pas « wip » ni « fixes ». Pourquoi : un historique lisible se relit et se révèrte proprement, commit par commit.
- **PRs courtes et focalisées.** Une PR difficile à résumer en trois phrases était trop grosse. Pourquoi : les petites PR se relisent, se vérifient et se révertent ; les grosses s'acceptent en soupirant, sans vraie relecture.
- **Jamais de force push sur `main`, jamais de `--no-verify`.** Le kit installe un hook qui bloque le second. Pourquoi : les garde-fous qu'on contourne « juste cette fois » meurent ce jour-là.

## Le cycle d'une session de travail

```
pull → branche → travail (commits atomiques) → push → PR → CI verte → merge → CLÔTURER la branche
```

Le dernier pas est celui que tout le monde saute, et c'est lui qui maintient le système sain. La section « rituel de clôture » plus bas le rend systématique et sûr.

## Le piège spécifique aux agents : les branches fantômes

Les sessions d'agents créent des branches (souvent auto-nommées). Le scénario qui dégénère, vécu et documenté : des sessions successives laissent chacune leur branche non mergée ; `main` gèle dans un état ancien ; la session suivante compare à `main`, croit que du travail « n'existe pas », et le refait. Résultat : doublons, conflits entre branches, et du budget brûlé à retraiter ce qui était déjà fait.

Le worktree amplifie le piège. Un worktree est une copie du repo posée dans un autre dossier, rattachée à une branche à elle. C'est pratique pour travailler sur deux sujets en parallèle, mais ça se cumule : des dossiers de travail s'accumulent, et le repo principal, lui, reste figé sur une vieille branche loin de `main`. Le piège classique : une nouvelle session démarre dans ce repo principal, cent commits dans le passé, sans le savoir.

**Les parades :**
1. **Clôturer chaque branche en fin de phase** : merger (ou jeter explicitement) la branche avant de passer à autre chose. Une branche n'est pas un brouillon éternel, c'est un travail en cours de livraison. Le rituel ci-dessous rend ce geste unique et sûr.
2. **Compter les fantômes à l'ouverture** : le hook `git-diagnostic.sh` du kit signale en début de session les branches d'agent non mergées, et le hook `branch-guard.sh` prévient si le repo courant est sur une branche en retard sur `main`. Plus de mauvaise surprise silencieuse.
3. **L'état de référence vit sur `main`.** Avant de comparer, dresser un état ou reprendre un travail : vérifier `git branch -a`. Si des branches portent du travail non mergé, les traiter d'abord.
4. **Une passe de ménage périodique** : lister les branches mortes, merger ce qui vaut, supprimer le reste. Dix minutes par mois.

## Le rituel de clôture de branche

Le problème à résoudre : les branches et les worktrees qui s'accumulent, et le repo principal qui reste figé sur une vieille branche loin de `main`. Tant qu'on range à la main, on oublie une étape ou on repousse le nettoyage. Le rituel remplace ce ménage manuel par une seule opération sûre. Le principe : **fin de phase = un rituel unique, pas un rangement dont on se souvient au cas par cas. Et une branche non mergée n'est jamais supprimée par accident.**

Les étapes, dans l'ordre :

1. **Vérifier que la branche est 100 % mergée dans `main`.** Quoi : `git branch --merged main` doit lister la branche. Pourquoi : c'est la seule preuve que le travail est bien arrivé à destination et que rien ne sera perdu en supprimant.
2. **Refuser de supprimer si non mergée.** Quoi : si la branche n'apparaît pas dans la liste mergée, on s'arrête, on ne détruit rien. Pourquoi : supprimer une branche non mergée efface du travail. Le garde-fou technique : `git branch -d` en minuscule refuse tout seul de supprimer une branche non mergée. On ne passe jamais à `-D` (majuscule, suppression forcée) sans une décision explicite et volontaire de jeter ce travail.
3. **Committer et pousser l'état restant.** Quoi : `git status` pour voir ce qui traîne, puis commit (Conventional Commits) et `git push`. Pourquoi : ne rien laisser dormir en local non sauvegardé avant de fermer.
4. **Revenir sur `main` et se mettre à jour.** Quoi : `git checkout main` puis `git pull`. Pourquoi : c'est ce qui évite le piège du repo figé cent commits en arrière. Le repo principal repart toujours d'un `main` frais.
5. **Supprimer la branche locale et le worktree.** Quoi : `git worktree remove <chemin>` s'il y en avait un, puis `git branch -d <branche>`. Pourquoi : c'est le geste qui empêche l'accumulation. La branche a livré, elle n'a plus de raison d'exister en local.
6. **Prouver l'état final propre.** Quoi : `git branch --show-current` (doit être `main`), `git status` (doit être clean et à jour), `git worktree list` (la branche close ne doit plus apparaître). Pourquoi : on ne se fie pas au fait d'avoir tapé les commandes, on lit la sortie qui confirme.

Le kit fournit tout ça sans avoir à le faire à la main :
- La commande **`/close-branch`** exécute ce rituel étape par étape, avec le refus de supprimer une branche non mergée intégré.
- Le hook **`branch-guard.sh`** prévient au démarrage d'une session si le repo courant est sur une branche en retard sur `main`, pour attraper le piège avant de commencer à travailler dessus par erreur.

## Multi-machine : la synchronisation

Si tu travailles sur plusieurs machines, la règle tient en deux gestes : **`git pull` en arrivant, commit + push en partant.** Sans exception, même pour « juste une petite modif ». Pourquoi : les repos concernés incluent tes repos de configuration et de connaissances (config d'agent, patterns, notes), pas seulement le code ; c'est justement eux qui divergent en silence quand on oublie de synchroniser.

Un hook de début de session peut automatiser le diagnostic (retard, avance, fichiers en attente) ; la version du kit le fait pour le repo courant.

## Ce que l'agent fait, ce que tu fais

L'agent exécute très bien la mécanique : brancher, committer proprement, pousser, ouvrir la PR avec une bonne description, dérouler le rituel de clôture. Ce qui reste à toi : décider **quand** on merge (après la preuve, chapitre 04), et ne jamais laisser une session se terminer en « on verra plus tard ». C'est comme ça que naissent les fantômes.
