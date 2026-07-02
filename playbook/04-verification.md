# 04. La vérification : la preuve ou rien

## Le problème de fond

Un agent annonce « c'est fait » avec une assurance parfaite, que ce soit vrai, partiellement vrai, ou faux. Ce n'est pas de la mauvaise foi : c'est un système qui produit du texte plausible, et « c'est fait » est la suite plausible d'une tâche. **Ta seule défense : exiger la preuve, systématiquement.**

La règle qui gouverne ce chapitre : une affirmation sans preuve n'est pas une information. « Les tests passent » sans la sortie des tests, « l'écran s'affiche bien » sans l'avoir affiché, ça ne compte pas.

## Les trois niveaux de preuve

### Niveau 1 : la machine (automatique, installé par le kit)

- **Typecheck** : le hook `typecheck-on-stop.sh` s'exécute quand l'agent termine ; s'il a introduit de nouvelles erreurs de types, il est renvoyé les corriger. Sans intervention de ta part.
- **Lint/format** : le hook `lint-format.sh` passe après chaque fichier modifié.
- **Tests** : toute logique métier a des tests. La sortie complète (pas un résumé) fait foi. Un test qui ne peut pas échouer (assertion creuse) est un mensonge : en cas de doute, demande « fais échouer ce test en cassant le code, montre-moi, puis répare ».

### Niveau 2 : le comportement (l'agent exécute, tu lis)

Pour du back ou un script : exécuter le vrai flux avec des cas réels et montrer la sortie. Cas nominal, cas d'erreur, cas limite (vide, doublon, gros volume). Pour une API : l'appel réel et sa réponse, pas la description de ce que la réponse devrait être.

### Niveau 3 : l'œil (l'agent affiche, tu constates)

Pour tout ce qui a une interface : **un vrai navigateur, pas une capture de terminal ni une promesse**. C'est le niveau le plus souvent bâclé, et celui qui coûte le plus cher quand il saute.

## La checklist UI

À dérouler avant tout « c'est fait » sur un écran :

**Desktop (~1440px)**
- La page cible s'affiche sans erreur console
- Layout conforme : espacements, alignements, hiérarchie visuelle
- Les états interactifs répondent (hover, focus, boutons, formulaires)

**Mobile (~375px)**
- Rien ne déborde, rien ne se chevauche
- Les zones tactiles sont utilisables, le scroll est sain
- Les formulaires restent remplissables

**Les états qu'on oublie toujours**
- Vide (aucune donnée) : l'écran dit quelque chose d'utile
- Erreur (réseau, serveur) : message compréhensible, pas d'écran blanc
- Chargement : pas de saut de layout brutal
- Débordement : texte long, nom à rallonge, 10 000 lignes

**Boucle de retouche** : si tu demandes une correction visuelle, la preuve se refait après. Un écran vérifié avant la retouche ne prouve rien sur l'écran d'après.

## Qui vérifie quoi

| Preuve | Qui | Quand |
|---|---|---|
| Typecheck, lint | Hooks (machine) | Automatique, à chaque édition / fin de tour |
| Tests | L'agent écrit et lance, tu lis la sortie | À chaque étape du plan |
| Comportement réel | L'agent exécute et montre | Avant chaque « c'est fait » |
| Écran desktop + mobile + états | L'agent affiche, **toi tu constates** | Avant merge de toute UI |
| Revue adversariale, audit sécurité | Agents relecteurs dédiés | Features lourdes (chapitre 03) |

La ligne du bas est la plus importante : si tu ne lis jamais le code, la vérification visuelle et comportementale est **ton** poste de contrôle. C'est non délégable les mauvais jours, non négociable les jours pressés.

## Le vocabulaire de la preuve

Bannis de ton vocabulaire d'acceptation : « ça devrait marcher », « normalement c'est bon », « j'ai fait le changement ». Exige : « le test X passe, voici la sortie », « voici l'écran à 375px », « voici la réponse de l'API avec le cas d'erreur ». Si l'agent n'a pas la preuve, la tâche n'est pas finie ; elle est en cours.
