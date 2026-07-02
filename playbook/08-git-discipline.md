# 08. La discipline git

Git est ton filet de sécurité et ta mémoire d'état. Avec un agent qui produit beaucoup et vite, la discipline git n'est pas du zèle : c'est ce qui rend chaque changement annulable et chaque état lisible.

## Les règles de base

- **Jamais de travail direct sur `main`.** Une branche par sujet : `feat/nom`, `fix/nom`, `refactor/nom`, `chore/nom`. `main` reste toujours déployable.
- **Conventional Commits, en anglais** : `feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`. Un commit = un changement logique, pas « wip » ni « fixes ».
- **PRs courtes et focalisées.** Une PR difficile à résumer en trois phrases était trop grosse. Les petites PR se relisent, se vérifient et se révertent ; les grosses s'acceptent en soupirant.
- **Jamais de force push sur `main`, jamais de `--no-verify`.** Le kit installe un hook qui bloque le second. Les garde-fous qu'on contourne « juste cette fois » meurent ce jour-là.

## Le cycle d'une session de travail

```
pull → branche → travail (commits atomiques) → push → PR → CI verte → merge → SUPPRIMER la branche
```

Le dernier pas est celui que tout le monde saute, et c'est lui qui maintient le système sain.

## Le piège spécifique aux agents : les branches fantômes

Les sessions d'agents créent des branches (souvent auto-nommées). Le scénario qui dégénère, vécu et documenté : des sessions successives laissent chacune leur branche non mergée ; `main` gèle dans un état ancien ; la session suivante compare à `main`, croit que du travail « n'existe pas », et le refait. Résultat : doublons, conflits éditoriaux entre branches, et du budget brûlé à retraiter ce qui était déjà fait.

**Les parades :**
1. **Terminer chaque session** : merger (ou jeter explicitement) la branche de la session avant de passer à autre chose. Une branche n'est pas un brouillon éternel, c'est un travail en cours de livraison.
2. **Compter les fantômes à l'ouverture** : le hook `git-diagnostic.sh` du kit signale en début de session les branches d'agent non mergées. Plus de mauvaise surprise silencieuse.
3. **L'état de référence vit sur `main`.** Avant de comparer, dresser un état ou reprendre un travail : vérifier `git branch -a`. Si des branches portent du travail non mergé, les traiter d'abord.
4. **Une passe de ménage périodique** : lister les branches mortes, merger ce qui vaut, supprimer le reste. Dix minutes par mois.

## Multi-machine : la synchronisation

Si tu travailles sur plusieurs machines, la règle tient en deux gestes : **`git pull` en arrivant, commit + push en partant.** Sans exception, même pour « juste une petite modif ». Les repos concernés incluent tes repos de configuration et de connaissances (config d'agent, patterns, notes), pas seulement le code : c'est justement eux qui divergent en silence.

Un hook de début de session peut automatiser le diagnostic (retard/avance/fichiers en attente) ; la version du kit le fait pour le repo courant.

## Ce que l'agent fait, ce que tu fais

L'agent exécute très bien la mécanique : brancher, committer proprement, pousser, ouvrir la PR avec une bonne description. Ce qui reste à toi : décider **quand** on merge (après la preuve, chapitre 04), et ne jamais laisser une session se terminer en « on verra plus tard » : c'est comme ça que naissent les fantômes.
