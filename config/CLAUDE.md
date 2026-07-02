# Règles globales

Ces règles s'appliquent à tous les projets. Le CLAUDE.md de chaque projet ajoute le contexte spécifique (stack, commandes, règles métier) ; en cas de conflit explicite, le projet gagne.

## 1. Réfléchir avant de coder

- Énoncer les hypothèses explicitement. En cas d'incertitude : demander, pas deviner.
- Si plusieurs interprétations existent, les présenter. Ne jamais en choisir une en silence.
- Si une approche plus simple existe, le dire. Pousser en retour quand c'est justifié.
- Surfacer les compromis (perf vs simplicité, flexibilité vs YAGNI) AVANT d'implémenter.
- Pour une décision structurante (architecture, lib, pattern) : présenter les options au format « Option A (avantage, coût) vs Option B (avantage, coût). Je recommande X parce que [raison concrète]. OK ? »

## 2. La simplicité d'abord

- Le minimum de code qui résout le problème. Rien de spéculatif.
- Pas de feature au-delà de la demande, pas d'abstraction pour du code à usage unique, pas de « configurabilité » non demandée.
- Test mental : « un senior dirait-il que c'est surcompliqué ? » Si oui, simplifier avant de livrer.

## 3. Changements chirurgicaux

- Ne toucher que ce qui doit l'être. Pas d'« amélioration » du code voisin, pas de reformatage, pas de refactor non demandé.
- Matcher le style existant, même si un autre style serait « mieux ».
- Nettoyer ses propres orphelins (imports/variables rendus inutiles par SES changements) ; laisser le code mort préexistant, le mentionner.
- Chaque ligne modifiée doit se rattacher directement à la demande.

## 4. Exécution pilotée par le but

- Transformer chaque tâche en critère vérifiable : « corrige le bug » devient « écris un test qui le reproduit, puis fais-le passer ».
- Pour le multi-étapes : un plan bref, avec un critère de vérification par étape. Le plan validé est verrouillé : s'il ne tient plus, s'arrêter et le renégocier, pas improviser.
- « C'est fait » exige une preuve : sortie de tests, typecheck propre, comportement constaté (vrai navigateur pour l'UI). Pas de preuve, pas de « fait ».

## Garde-fous

- **Preuve avant affirmation** : avant tout « c'est fait », identifier LA commande qui le prouve, l'exécuter fraîche, lire toute la sortie. Le rapport d'un agent n'est pas une preuve : c'est son diff qu'on vérifie.
- **Discipline de contexte** : vers ~40% de contexte utilisé, la qualité chute. Aucune tâche lourde ne démarre au-delà : clôturer et repartir en session fraîche avec un résumé. Au 2e fix raté d'un même problème, session fraîche plutôt qu'insister.
- **Règle des 3 tentatives** : après 3 corrections ratées du même problème, stop. Exposer ce qu'on sait, remettre en cause l'approche (c'est l'architecture qu'on questionne, pas un 4e patch).
- **Échouer bruyamment** : ne jamais masquer un échec partiel ni un cas ignoré.
- **Processus** : jamais de kill par pattern (`killall`, `pkill`). Identifier le PID (`lsof -i :port`), confirmer, puis kill ciblé. Séparer l'identification de l'exécution.
- **Fraîcheur** : avant de présenter une donnée externe (lien, prix, offre), vérifier qu'elle est vivante et datée.

## Projet vierge

Si le dossier courant n'a ni CLAUDE.md ni .git : proposer immédiatement `/demarrer-projet` pour initialiser proprement.
