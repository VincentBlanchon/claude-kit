# 02. L'art du CLAUDE.md

## À quoi ça sert

`CLAUDE.md` est le fichier d'instructions que l'agent charge à chaque session. Il en existe deux niveaux : le **global** (`~/.claude/CLAUDE.md`, ton comportement de base sur tous les projets, installé par ce kit) et le **projet** (`CLAUDE.md` à la racine du repo, le contexte spécifique : stack, commandes, règles métier).

C'est le levier le plus rentable de tout ton setup. Un retour d'expérience documenté sur une trentaine de codebases mesure l'effet d'un bon fichier de règles : taux d'erreur divisé par dix. Aucun autre réglage n'approche ce rendement.

## Les 4 règles fondatrices (Karpathy)

Tout CLAUDE.md sérieux repose sur ces quatre principes, dans cet ordre :

1. **Réfléchir avant de coder.** Énoncer les hypothèses. Si plusieurs interprétations existent, les présenter au lieu d'en choisir une en silence. Si quelque chose est confus, s'arrêter et demander.
2. **La simplicité d'abord.** Le minimum de code qui résout le problème. Pas de feature au-delà de la demande, pas d'abstraction pour un usage unique, pas de gestion d'erreur pour des scénarios impossibles.
3. **Changements chirurgicaux.** Ne toucher que ce qui doit l'être. Ne pas « améliorer » le code voisin, ne pas reformater, matcher le style existant. Chaque ligne modifiée doit se rattacher à la demande.
4. **Exécution pilotée par le but.** Transformer chaque tâche en critère vérifiable (« corrige le bug » devient « écris un test qui le reproduit, puis fais-le passer ») et boucler jusqu'à ce que le critère soit vert.

## Les règles complémentaires qui ont fait leurs preuves

À piocher selon tes besoins (pas toutes à la fois, voir la limite plus bas) :

- **Lire avant d'écrire.** Avant de créer une fonction, chercher si elle existe (exports, utilitaires partagés). Le « ça a l'air indépendant » est le tueur silencieux des codebases.
- **Conformité avant goût.** Si la codebase fait X d'une certaine façon, faire pareil, même si une « meilleure » façon existe. Un pattern divergent introduit en douce coûte plus qu'il ne rapporte.
- **Échouer bruyamment.** Interdit de masquer un échec partiel (« 14 % des enregistrements sautés » doit remonter, pas disparaître dans un log).
- **Checkpoint en tâche longue.** Toutes les grosses étapes : résumer où on en est, vérifier, continuer. Ça prévient la dérive.
- **Deux patterns contradictoires dans le code : ne pas moyenner.** Prendre le plus testé, signaler l'autre.
- **La règle des 3 tentatives.** Après 3 corrections ratées du même bug, interdiction de tenter une 4e : s'arrêter, exposer ce qu'on sait, remettre en cause l'approche. (Anti « tourner en rond », validée en pratique.)

## Les limites dures (mesurées, pas théoriques)

- **Une douzaine de règles maximum.** Au-delà, la conformité s'effondre : l'agent en respecte certaines et en oublie d'autres, sans te prévenir.
- **Moins de 200 lignes.** Même phénomène. Un CLAUDE.md est un contrat, pas une documentation.
- **Des règles, pas des essais.** Chaque ligne en impératif, vérifiable. « Fais attention à la qualité » ne sert à rien ; « zéro warning de lint » se vérifie.

Si tu dépasses : sors le surplus dans des `rules/` thématiques chargées globalement (ce kit en installe 5) ou dans des skills chargés à la demande. Le CLAUDE.md garde l'essentiel.

## Le CLAUDE.md projet

À la racine de chaque repo, moins de 100 lignes, et surtout **ce que l'agent ne peut pas deviner** :

```markdown
# [Projet] : règles

## Contexte
[2-3 phrases : ce que fait le produit, pour qui, où il en est]

## Stack et commandes
- [framework, base, hébergement]
- Dev : `pnpm dev` · Tests : `pnpm test` · Build : `pnpm build`

## Règles métier non négociables
- [ex : les montants sont TOUJOURS en centimes]
- [ex : jamais d'appel direct à la table X, passer par le service Y]

## Pièges connus
- [ce qui a déjà mordu : 5 entrées max, les plus récentes gagnent]
```

Ce qui n'y va PAS : la roadmap (vit dans `docs/`), l'historique des décisions (vit dans la mémoire ou `docs/`), tout ce que l'agent peut lire dans le code lui-même.

## L'erreur classique

Traiter le CLAUDE.md comme un grenier : chaque incident y ajoute une règle, personne n'en retire jamais. Au bout de six mois, 400 lignes, et l'agent n'en respecte plus la moitié. Le bon rituel : à chaque ajout, se demander ce qu'on retire, et une relecture par trimestre pour purger ce qui est devenu obsolète ou automatisable par un hook (chapitre [07](07-hooks-et-securite.md) : une règle qu'un hook peut faire respecter n'a rien à faire dans le CLAUDE.md).
