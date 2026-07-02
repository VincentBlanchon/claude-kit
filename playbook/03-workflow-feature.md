# 03. Le workflow feature

Le cycle complet pour toute demande qui dépasse la retouche : comprendre, planifier, verrouiller, construire, vérifier, livrer. C'est là que se joue la différence entre « ça avance vite » et « ça avance vraiment ».

## Vue d'ensemble

```
Comprendre → Planifier → VERROUILLER le plan → Construire → Vérifier (preuve) → PR
     ↑                                              |
     └────────── si blocage ou dérive ──────────────┘
```

Tes deux points de contrôle de builder : **avant** le build (le plan) et **après** (la preuve). Entre les deux, l'agent travaille, tu n'as pas besoin de surveiller chaque ligne.

## Étape 1 : comprendre (l'agent reformule, tu confirmes)

Avant toute ligne de code, l'agent doit reformuler : ce qu'il a compris du besoin, ce qui est dans le scope, ce qui n'y est pas, et ses hypothèses. Si plusieurs interprétations existent, il les présente et tu tranches.

Ta discipline en miroir : décris le **problème** (qui, quoi, pourquoi), pas la solution technique. Tu peux suggérer une piste, mais laisse l'agent proposer ; il connaît des options que tu ne connais pas, et l'inverse est vrai aussi.

## Étape 2 : planifier

Pour tout ce qui touche plus d'un ou deux fichiers : un plan écrit, découpé en étapes, avec pour chaque étape son **critère de vérification**.

```
1. Ajouter la colonne `status` en base        → vérif : migration passe en local
2. Endpoint PATCH /orders/:id/status          → vérif : 3 tests API (ok, interdit, inexistant)
3. Bouton de changement de statut dans la fiche → vérif : visible et fonctionnel dans le navigateur
```

Un plan sans critères de vérification n'est pas un plan, c'est une intention. Astuce d'exigence : demander à l'agent « qu'est-ce qui pourrait rendre ce plan faux ? » avant de valider. Sur un sujet lourd (architecture, migration), faire challenger le plan par un deuxième agent en lecture seule est un excellent investissement.

## Étape 3 : verrouiller

Une fois le plan validé, **il ne bouge plus sans te repasser dessus**. Si l'agent découvre en cours de route que le plan ne tient pas, la règle est : s'arrêter, expliquer, proposer un plan révisé, attendre ton feu vert. Pas d'improvisation silencieuse.

C'est la parade au symptôme classique : tu valides A, tu reviens une heure après, et tu découvres A' plus trois « améliorations » que personne n'a demandées.

## Étape 4 : construire

- **Une branche par feature** (`feat/nom-court`), jamais sur `main` (chapitre [08](08-git-discipline.md)).
- **Étape par étape, dans l'ordre du plan.** Chaque étape se termine par sa vérification, pas par « passons à la suite ».
- **La règle des 3 tentatives** : au 3e échec sur le même problème, l'agent s'arrête et remet en cause l'approche au lieu d'empiler des rustines.
- **Le frein à l'ambition** : tout ce qui n'est pas dans le plan est signalé, pas implémenté.

## Étape 5 : vérifier, avec preuve

Le chapitre [04](04-verification.md) y est entièrement consacré. Version courte : tests verts + typecheck propre + comportement constaté dans un vrai navigateur (ou le vrai environnement d'exécution). L'agent présente la preuve, tu constates.

## Étape 6 : livrer

PR courte et focalisée, description qui dit quoi et pourquoi, CI verte, merge, suppression de branche. Une PR = un changement logique. Si la PR est difficile à décrire en trois phrases, elle était trop grosse.

## Escalade : les features lourdes

Auth, paiement, données sensibles, migration structurante, ou plus de 5 fichiers touchés : le workflow s'alourdit volontairement.

- **Double relecture** : une revue adversariale du code (un agent relecteur distinct, prompté pour chercher ce qui casse, pas pour approuver) plus une passe QA (build, lint, tests, typecheck, verdict PASS/FAIL).
- **Audit sécurité** avant merge : inputs validés, auth vérifiée sur chaque route, pas de secret en clair, pas de données sensibles loguées (l'agent `security-auditor` du kit fait exactement ça).
- **Attention au biais d'approbation** : un agent relecteur a tendance à valider poliment. Le prompt qui marche : « liste chaque problème trouvé avec ton niveau de confiance », plutôt que « dis-moi si c'est bon ». On filtre ensuite, mais rien n'est tu.

## Les petites tâches

Typo, renommage, correction d'une ligne : pas de rituel, juste la demande et la vérification. Le workflow complet est un outil, pas une liturgie. Le bon critère : est-ce que je saurais annuler ce changement facilement si c'est raté ? Si oui, va vite. Si non, plan.
