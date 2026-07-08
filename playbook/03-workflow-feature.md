# 03. Le workflow feature

Le cycle complet pour toute demande qui dépasse la retouche : comprendre, planifier, verrouiller, construire, vérifier, livrer. C'est là que se joue la différence entre « ça avance vite » et « ça avance vraiment ».

## Vue d'ensemble

```
Comprendre → Planifier → VERROUILLER le plan → Construire → Vérifier (preuve) → PR
     ↑                                              |
     └────────── si blocage ou dérive ──────────────┘
```

Tes deux points de contrôle de builder : **avant** le build (le plan) et **après** (la preuve). Entre les deux, l'agent travaille, tu n'as pas besoin de surveiller chaque ligne.

## Le contrat d'autonomie

Le principe qui régit tout le reste : **si l'agent peut faire une action lui-même, il la fait et montre la preuve. Il ne te renvoie pas la balle.** Te relancer juste pour un « GO » sur une action réversible n'est pas de la prudence, c'est un échec. Chaque aller-retour inutile te coûte une interruption et casse le rythme.

QUOI : l'agent range chaque action dans une des deux listes.

**Liste blanche (l'agent fait seul, sans demander)** :
- Migrations de base de données en dev ou staging.
- Renommages, refactors.
- Commits, push sur une branche de travail (jamais `main`).
- Brancher et utiliser un CLI (outil en ligne de commande d'un service : hébergement, base de données, GitHub).
- Corriger une CI rouge (la CI, c'est le robot qui teste ton code à chaque push ; « rouge » = un test a cassé).
- Créer une pull request.
- Générer des données de test.

**Liste rouge (accord humain explicite requis avant d'agir)** :
- Merge sur `main` (la branche de référence, celle qui part en production).
- Déploiement en production.
- Toute action qui coûte de l'argent ou détruit des données de façon irréversible.
- Création ou suppression d'un compte.
- Envoi vers l'extérieur (email, publication).

POURQUOI cette frontière : l'autonomie sur le réversible te fait gagner un temps réel, parce que tout ce qui peut s'annuler (un commit, un rename, une migration en dev) ne mérite pas une validation. Le garde-fou protège l'irréversible, là où une erreur ne se rattrape pas. La ligne se trace sur une seule question : « si c'est raté, est-ce que ça s'annule facilement ? » Oui, l'agent agit. Non, il demande.

C'est une doctrine à adapter, pas une loi universelle. Chacun place sa ligne rouge où il la sent : plus permissif si tu fais confiance et que tout est sauvegardé, plus strict sur un projet sensible. L'important, c'est que la frontière soit posée AVANT, pas négociée à chaque action.

## Étape 1 : comprendre (l'agent reformule, tu confirmes)

Avant toute ligne de code, l'agent doit reformuler : ce qu'il a compris du besoin, ce qui est dans le scope, ce qui n'y est pas, et ses hypothèses. Si plusieurs interprétations existent, il les présente et tu tranches.

Ta discipline en miroir : décris le **problème** (qui, quoi, pourquoi), pas la solution technique. Tu peux suggérer une piste, mais laisse l'agent proposer ; il connaît des options que tu ne connais pas, et l'inverse est vrai aussi.

**Auto-provisionnement des accès en entrée de projet.** Avant de construire, l'agent vérifie que ses propres accès sont en place, et câble lui-même ce qui manque, au lieu de te renvoyer la corvée.

QUOI, en trois temps :
1. **Inventaire** : de quels outils ce projet a besoin (base de données, hébergement, CLI, serveur MCP) et lesquels sont déjà branchés et authentifiés.
2. **Câblage** : ce qui manque, l'agent le met en place lui-même (connexion d'un CLI, lien du projet, activation d'un MCP). Un MCP, c'est un connecteur qui donne à l'agent l'accès à un service extérieur, comme une prise que l'on branche.
3. **Blocage réel** : s'il bute sur un secret que toi seul détiens (une clé d'API, un mot de passe), il te le dit une fois, précisément, avec la commande exacte à lancer. Puis il continue tout ce qui ne dépend pas de ce secret, au lieu de rester figé sur l'ensemble.

POURQUOI : éviter le ping-pong « va faire ça pour moi ». Un accès manquant ne doit jamais bloquer tout le projet ni te transformer en assistant de l'agent. Il se débrouille pour ce qu'il peut, et ne t'appelle que pour ce que lui seul ne peut pas obtenir.

## Étape 2 : planifier

Pour tout ce qui touche plus d'un ou deux fichiers : un plan écrit, découpé en étapes, avec pour chaque étape son **critère de vérification**.

```
1. Ajouter la colonne `status` en base        → vérif : migration passe en local
2. Endpoint PATCH /orders/:id/status          → vérif : 3 tests API (ok, interdit, inexistant)
3. Bouton de changement de statut dans la fiche → vérif : visible et fonctionnel dans le navigateur
```

Un plan sans critères de vérification n'est pas un plan, c'est une intention.

**Découpe en tranches VERTICALES, pas en couches techniques.** Une tranche traverse tout (un petit bout d'écran + son API + sa donnée) et se démontre dans le navigateur ; une couche (« d'abord toute la base, puis toute l'API… ») ne montre rien avant la fin. Avec des tranches, chaque étape du plan est constatable de tes yeux, et tu peux t'arrêter à n'importe laquelle avec un produit qui marche.

**Si la demande vient d'une vraie réflexion produit** (chapitre 01, skill take-your-time) : elle arrive sous forme de SPEC courte validée (besoin, scope, hors-scope, critères). Charge la SPEC dans une session FRAÎCHE et construis depuis elle : la session de réflexion est polluée par l'exploration, elle ne construit jamais. Astuce d'exigence : demander à l'agent « qu'est-ce qui pourrait rendre ce plan faux ? » avant de valider. Sur un sujet lourd (architecture, migration), faire challenger le plan par un deuxième agent en lecture seule est un excellent investissement.

## Étape 3 : verrouiller

Une fois le plan validé, **il ne bouge plus sans te repasser dessus**. Si l'agent découvre en cours de route que le plan ne tient pas, la règle est : s'arrêter, expliquer, proposer un plan révisé, attendre ton feu vert. Pas d'improvisation silencieuse.

C'est la parade au symptôme classique : tu valides A, tu reviens une heure après, et tu découvres A' plus trois « améliorations » que personne n'a demandées.

## Étape 4 : construire

- **Une branche par feature** (`feat/nom-court`), jamais sur `main` (chapitre [08](08-git-discipline.md)).
- **Étape par étape, dans l'ordre du plan.** Chaque étape se termine par sa vérification, pas par « passons à la suite ».
- **La règle des 3 tentatives** : au 3e échec sur le même problème, l'agent s'arrête et remet en cause l'approche au lieu d'empiler des rustines.
- **Le frein à l'ambition** : tout ce qui n'est pas dans le plan est signalé, pas implémenté.

**La boucle vers le but, par défaut sur le multi-étapes.** Sur une tâche à plusieurs étapes dont le résultat se vérifie automatiquement, l'agent tourne en boucle jusqu'au critère au lieu de te rendre la main à chaque étape. Il enchaîne : fait une étape, vérifie, corrige si besoin, passe à la suivante, jusqu'à ce que le critère soit atteint.

Exemple de critère : « tous les tests du dossier auth passent et le lint est propre ». L'agent boucle seul jusque-là, sans t'appeler entre-temps.

Condition impérative : **le critère de succès est clair AVANT de lancer la boucle.** Un critère net (« ces tests passent »), l'agent peut boucler en autonomie. Un critère flou (« rends ça mieux »), il n'y a rien vers quoi boucler : l'agent ne lance pas la boucle, il définit d'abord le critère avec toi.

POURQUOI : supprimer les relances vides. Sans ça, l'agent te rend la main à chaque tour et tu passes ton temps à taper « continue » ou « go » sans rien décider. Ces relances ne t'apprennent rien et te font perdre du temps. Un critère vérifiable transforme dix allers-retours en un seul : tu poses le but, l'agent y va, tu constates le résultat.

## Étape 5 : vérifier, avec preuve

Le chapitre [04](04-verification.md) y est entièrement consacré. Version courte : tests verts + typecheck propre + comportement constaté dans un vrai navigateur (ou le vrai environnement d'exécution). L'agent présente la preuve, tu constates.

## Étape 6 : livrer

PR courte et focalisée, description qui dit quoi et pourquoi, CI verte, merge, suppression de branche. Une PR = un changement logique. Si la PR est difficile à décrire en trois phrases, elle était trop grosse.

## Escalade : les features lourdes

Auth, paiement, données sensibles, migration structurante, ou plus de 5 fichiers touchés : le workflow s'alourdit volontairement.

- **Double relecture** : une revue adversariale du code (un agent relecteur distinct, prompté pour chercher ce qui casse, pas pour approuver) plus une passe QA (build, lint, tests, typecheck, verdict PASS/FAIL).
- **Audit sécurité** avant merge : inputs validés, auth vérifiée sur chaque route, pas de secret en clair, pas de données sensibles loguées (l'agent `security-auditor` du kit fait exactement ça).
- **Attention au biais d'approbation** : un agent relecteur a tendance à valider poliment. Le prompt qui marche : « liste chaque problème trouvé avec ton niveau de confiance », plutôt que « dis-moi si c'est bon ». On filtre ensuite, mais rien n'est tu.

## Le pilotage en session : les 5 règles anti-déraillement

Une analyse forensique de 69 sessions réelles a mesuré pourquoi les sessions partent en vrille. Cinq causes reviennent, cinq parades à exiger de l'agent (et à s'appliquer à soi-même) :

1. **Le chemin critique est verrouillé.** Dès qu'une deadline ou une priorité est nommée, il n'y a plus qu'une priorité. Les optimisations et pistes annexes se NOTENT pour après, elles ne se proposent pas avant. Si c'est TOI qui dévies en cours de route, un bon agent doit te le signaler, pas te suivre en silence.
2. **Vérifier avant de supposer.** Tout ce qui se vérifie en 2 minutes (une requête, un grep, un diff) se vérifie AVANT d'être affirmé. Et dès qu'une tâche touche des données réelles : état des lieux chiffré + « peut-on perdre quelque chose ? » + sauvegarde, avant tout changement.
3. **Une seule tâche lourde à la fois.** Lancer trois recherches et deux builds en parallèle produit du chaos, pas de la vitesse. Séquentiel par défaut ; le parallèle se propose avec une estimation, il ne s'improvise pas. Cas particulier des ingestions massives (plus de ~100 fichiers, vidéos, pages) : chiffrer AVANT (volume, mémoire, durée) et découper en lots. Une tâche qui fait ramer la machine est un incident, pas du travail.
4. **Une phase par conversation.** Concevoir OU coder OU déboguer. Une idée d'une autre phase émerge ? Elle se note en une ligne, elle ne s'exécute pas.
5. **Le scope s'annonce avant de produire.** Sur toute tâche ouverte (audit, recherche, refonte) : « je vise N points, l'essentiel d'abord, le détail si tu valides ». Cinquante pages quand cinq suffisent à décider, c'est du bruit, pas du travail.

Et le mode incident : quand quelque chose sent le roussi (données, prod), la bonne réponse est un état des lieux ultra-court, trois faits vérifiés, un risque, une prochaine action. Pas un pavé rassurant.

## Les petites tâches

Typo, renommage, correction d'une ligne : pas de rituel, juste la demande et la vérification. Le workflow complet est un outil, pas une liturgie. Le bon critère : est-ce que je saurais annuler ce changement facilement si c'est raté ? Si oui, va vite. Si non, plan.
