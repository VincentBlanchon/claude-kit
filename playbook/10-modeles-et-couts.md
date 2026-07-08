# 10. Modèles et coûts

## Le principe : adapter la puissance à la tâche

Utiliser le modèle le plus puissant pour tout, c'est rouler en camion pour aller chercher le pain. Ça marche, et un jour le budget (abonnement à quota comme l'API) te rattrape, en général le pire jour de la semaine.

La hiérarchie mentale, valable quelle que soit la génération de modèles du moment :

| Gamme | Pour quoi | Exemples |
|---|---|---|
| **Rapide et léger** (type Haiku) | Tâches mécaniques et bien bornées | Renommages, extractions, classifications, résumés courts, scripts jetables |
| **Équilibré** (type Sonnet) | Le quotidien du code | Features standard, refactors cadrés, tests, la majorité des sessions |
| **Puissant** (type Opus et au-delà) | Ce qui demande du jugement | Architecture, plans complexes, debugging retors, revues critiques, sécurité |

Le retour d'expérience qui compte : **une fois le système bien construit** (règles courtes, skills, vérifications automatiques), la gamme légère absorbe une énorme part du travail réel. C'est le chapitre 01 dans une autre langue : le système compte plus que le modèle. Si tu as l'impression que « seul le gros modèle y arrive », c'est souvent ta config qui sous-cadre, pas le petit modèle qui sous-performe.

## L'effort : le deuxième curseur

Sur les modèles récents, l'effort de raisonnement se règle (`low` / `medium` / `high` et plus). Effort haut = le modèle réfléchit plus longtemps avant de répondre ; effort bas = il exécute vite, presque sans détour. Pense à quelqu'un qui relit sa copie avant de la rendre, contre quelqu'un qui répond au premier jet.

Le réglage par défaut a changé, et c'est important : **l'effort `high` est désormais le défaut assumé au quotidien**. Ne le baisse pas « pour économiser ».

Pourquoi ce virage. Les modèles récents raisonnent nettement mieux quand on les laisse raisonner. À effort haut, ils attrapent les cas limites, relisent leur propre logique, se corrigent avant de rendre. Résultat concret : moins de reprises. Un premier jet bâclé qu'il faut refaire deux fois coûte plus cher, en tokens ET en temps, qu'une réponse posée du premier coup. L'effort haut n'est pas un luxe, c'est ce qui évite le travail refait.

La nuance coût reste honnête : sur le vraiment mécanique et bien borné (renommer, extraire, classer, un script jetable), tu peux descendre en effort bas ET prendre un petit modèle. Là, il n'y a rien à « réfléchir », donc payer de la profondeur ne rapporte rien. Mais c'est l'exception réservée aux tâches sans jugement, pas la règle par défaut.

## Quand un résultat rate : « pas su » ou « pas essayé »

Avant de toucher au moindre réglage quand une réponse déçoit, pose-toi UNE question : l'échec vient-il d'un manque de capacité ou d'un manque de rigueur ?

L'analogie : un élève rend un mauvais devoir. Deux causes possibles. Soit il ne connaissait pas la leçon (capacité) : lui répéter « fais un effort » ne changera rien, il faut lui apprendre la matière. Soit il connaissait mais a bâclé, répondu trop vite (rigueur) : là, lui demander de reprendre au calme suffit.

Traduction sur les curseurs :

- **Échec de capacité** (le modèle ne SAVAIT pas, sujet hors de sa portée) → **monte le MODÈLE**. Passer à effort haut sur un petit modèle ne créera pas la connaissance qui manque.
- **Échec de rigueur** (le modèle SAVAIT mais a survolé, sauté une étape, mal vérifié) → **monte l'EFFORT** avant de changer de modèle. Souvent ça suffit, et ça coûte moins cher que de sortir le gros modèle.

Le réflexe qui fait gaspiller : dégainer le modèle le plus puissant à la moindre déception, alors qu'un cran d'effort en plus réglait le problème.

## Les patterns qui économisent gros

- **Planifier haut, exécuter bas.** Le plan par un modèle puissant à effort haut ; l'exécution des étapes par un modèle équilibré. Le plan encadre l'exécution, la qualité tient.
- **Le conseiller (advisor).** Un modèle léger exécute ; quand il bloque, il consulte un modèle puissant, puis reprend. Documenté en production : des performances proches du haut de gamme pour une fraction du coût. À monter dès que tu automatises des tâches récurrentes.
- **Déléguer le borné à un exécuteur moins cher.** Une tâche scopée et bornée (un périmètre clair, une fin nette : appliquer un plan déjà validé, renommer partout, une extraction) n'a pas besoin du modèle qui coûte le plus cher. Confie-la à un modèle ou un agent moins cher (souvent 2 à 4 fois moins de tokens ; un outil comme Codex sert exactement à ça). L'intérêt : tu réserves le gros modèle à ce que lui seul fait bien, le raisonnement long en plusieurs étapes où le fil se perd facilement. Règle simple : borné et cadré → exécuteur léger ; long et sinueux → gros modèle.
- **Déléguer les recherches aux sous-agents** avec un modèle léger : lire 40 fichiers pour en résumer 3 idées n'exige aucun génie, juste de la patience.
- **La voie navigateur, déléguée aussi.** Les tâches qui pilotent un navigateur (cliquer, remplir, vérifier une page, ce qu'on appelle Computer Use), surtout répétitives, partent à un exécuteur rapide dédié. Ton thread principal orchestre : il dit quoi faire et lit le résultat, il ne fait pas le clic-à-clic lui-même. Pourquoi : le clic-à-clic est lent et verbeux, il gonfle le contexte du thread principal pour rien. Autant le sortir vers un exécuteur fait pour ça.
- **Les hooks plutôt que les tokens.** Chaque vérification faite par un script (lint, typecheck) est une vérification que tu ne paies pas en allers-retours de modèle.

## Tenir un budget sur abonnement à quota

Si ton offre a un plafond (hebdomadaire ou autre), la discipline :

1. **Connaître sa consommation.** Regarder l'usage en cours de semaine ; si la moitié du quota part le premier jour, les réglages sont mauvais, pas la semaine.
2. **Classer ses tâches.** Avant chaque grosse session : est-ce du jugement (gamme puissante justifiée), du quotidien (gamme équilibrée, effort haut par défaut), ou du mécanique borné (gamme légère, effort bas) ? Le curseur d'économie, c'est le choix de la gamme et le tri des tâches, pas le fait de brider l'effort au quotidien.
3. **Chasser les fuites structurelles.** Les deux classiques : les sessions interminables jamais nettoyées (tout le contexte se re-traite en boucle : `/clear`, chapitre 05) et le travail refait en double à cause d'états git confus (branches fantômes, chapitre 08). Dans les usages réels, ces deux fuites coûtent plus que le choix du modèle.
4. **Garder le puissant pour les moments à levier.** Un plan d'architecture raté coûte des jours ; une extraction de données ratée coûte une relance. Mets l'argent là où l'erreur est chère.

## En une phrase

Le bon réflexe n'est pas « quel est le meilleur modèle ? » mais « quel est le modèle le moins puissant qui fait cette tâche correctement dans mon système ? » : c'est ce réflexe-là qui rend l'usage intensif durable.
