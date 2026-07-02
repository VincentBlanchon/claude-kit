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

Sur les modèles récents, l'effort de raisonnement se règle (`low` / `medium` / `high` et plus). Effort haut = plus profond, plus lent, plus cher ; effort bas = exécution stricte de la demande, rapide.

En pratique : effort bas ou moyen pour l'exécution cadrée (le plan est validé, il n'y a qu'à faire), effort haut pour la conception et le diagnostic (là où la profondeur paie). Régler l'effort par défaut à haut « pour être tranquille » est le gaspillage le plus courant.

## Les patterns qui économisent gros

- **Planifier haut, exécuter bas.** Le plan par un modèle puissant à effort haut ; l'exécution des étapes par un modèle équilibré. Le plan encadre l'exécution, la qualité tient.
- **Le conseiller (advisor).** Un modèle léger exécute ; quand il bloque, il consulte un modèle puissant, puis reprend. Documenté en production : des performances proches du haut de gamme pour une fraction du coût. À monter dès que tu automatises des tâches récurrentes.
- **Déléguer les recherches aux sous-agents** avec un modèle léger : lire 40 fichiers pour en résumer 3 idées n'exige aucun génie, juste de la patience.
- **Les hooks plutôt que les tokens.** Chaque vérification faite par un script (lint, typecheck) est une vérification que tu ne paies pas en allers-retours de modèle.

## Tenir un budget sur abonnement à quota

Si ton offre a un plafond (hebdomadaire ou autre), la discipline :

1. **Connaître sa consommation.** Regarder l'usage en cours de semaine ; si la moitié du quota part le premier jour, les réglages sont mauvais, pas la semaine.
2. **Classer ses tâches.** Avant chaque grosse session : est-ce de la conception (gamme puissante justifiée) ou de l'exécution (gamme équilibrée, effort modéré) ?
3. **Chasser les fuites structurelles.** Les deux classiques : les sessions interminables jamais nettoyées (tout le contexte se re-traite en boucle : `/clear`, chapitre 05) et le travail refait en double à cause d'états git confus (branches fantômes, chapitre 08). Dans les usages réels, ces deux fuites coûtent plus que le choix du modèle.
4. **Garder le puissant pour les moments à levier.** Un plan d'architecture raté coûte des jours ; une extraction de données ratée coûte une relance. Mets l'argent là où l'erreur est chère.

## En une phrase

Le bon réflexe n'est pas « quel est le meilleur modèle ? » mais « quel est le modèle le moins puissant qui fait cette tâche correctement dans mon système ? » : c'est ce réflexe-là qui rend l'usage intensif durable.
