---
name: demarrer-projet
description: "Initialise un nouveau projet proprement : cadrage du besoin, choix de stack argumenté, CLAUDE.md projet, git, structure de départ. À utiliser quand l'utilisateur dit « nouveau projet », « on démarre », « init projet », ou quand le dossier courant est vierge (ni CLAUDE.md ni .git). Aussi : /demarrer-projet."
---

# /demarrer-projet : initialisation guidée

Objectif : qu'un projet parte sur des rails (vision claire, stack adaptée, config propre) au lieu d'une page blanche. Dérouler les 4 phases DANS L'ORDRE, une à la fois. Ne pas coder de feature pendant l'initialisation.

## Phase 1 : cadrer (15 minutes qui économisent des semaines)

Poser ces questions par petits blocs (pas tout d'un coup), reformuler les réponses, et ne passer à la phase 2 qu'une fois le cadre confirmé :

1. **Le problème** : quel problème concret ce projet résout-il ? Pour qui ? Comment ces gens font-ils AUJOURD'HUI sans le projet ?
2. **Le scope minimal** : quelle est la plus petite version qui rend déjà service ? Qu'est-ce qui est explicitement HORS scope pour l'instant ?
3. **Les contraintes** : budget (hébergement, services payants), délai, niveau technique de l'utilisateur, besoin multi-utilisateurs ou mono, données sensibles ou pas.
4. **Le critère de réussite** : dans un mois, à quoi voit-on que ça marche ?

Si l'utilisateur veut aller plus loin sur la réflexion produit (marché, valeur, risques), enchaîner sur le skill `take-your-time` avant de continuer.

## Phase 2 : choisir la stack (argumentée, pas imposée)

- Proposer une stack ADAPTÉE au projet et au profil (pas la stack à la mode) : pour une app web classique, un défaut solide est Next.js + Tailwind + shadcn/ui + Supabase + Vercel ; pour un script ou un outil interne, rester minimal (Node ou Python, zéro framework).
- Format obligatoire : « Option A (avantage, coût) vs Option B (avantage, coût). Je recommande X parce que [raison concrète liée au cadrage]. OK ? »
- Vérifier les patterns existants de l'utilisateur (`~/.claude/patterns/`) : s'il a déjà des conventions de stack, les proposer par défaut.
- En cas de doute sur un choix important (base de données, auth, hébergement), utiliser l'agent `stack-advisor` pour une recommandation documentée.

## Phase 3 : poser la vision et la roadmap

1. Écrire `docs/vision-produit.md` : le problème, la cible, le scope V1, ce qui est hors scope, le critère de réussite (issu de la phase 1).
2. Si le projet dépasse le week-end : faire construire une roadmap par phases par l'agent `roadmap-builder` (chaque phase avec son livrable et sa définition de « fini »).

## Phase 4 : installer les rails

1. `git init`, premier commit, et création du repo distant si souhaité (`gh repo create`, visibilité à confirmer avec l'utilisateur).
2. Créer le `CLAUDE.md` projet depuis le template du kit (`templates/CLAUDE-projet.md` du repo claude-kit, ou reconstruire la même structure) : description, commandes, architecture, règles métier, pièges. MOINS DE 100 LIGNES.
3. `.gitignore` adapté à la stack (inclure `.env*`, sauf `.env.example`).
4. `.env.example` avec les variables attendues (valeurs bidon), jamais de vrai secret.
5. Structure de départ minimale de la stack choisie (create-next-app ou équivalent), qui build et démarre : vérifier en lançant réellement le dev server.
6. Si le projet a une UI : créer `DESIGN.md` (direction artistique à verrouiller AVANT le premier écran, voir le skill `designsense`).

## Fin d'initialisation

Récapituler en 5 lignes : ce qui a été créé, la stack retenue et pourquoi, la première étape de la roadmap, et la commande pour démarrer. Puis s'arrêter : la première feature est une nouvelle session.
