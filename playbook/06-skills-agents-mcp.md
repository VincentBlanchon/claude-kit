# 06. Skills, agents, MCP : trois outils différents

Trois mécanismes d'extension qui se ressemblent de loin et ne servent pas du tout la même chose. Le moyen mnémotechnique :

- **Skill = enseigner COMMENT.** Une recette, un workflow, un savoir-faire que l'agent charge quand la situation le demande.
- **Sous-agent = déléguer À QUELQU'UN.** Un spécialiste avec son propre contexte, qui fait un travail borné et revient avec une conclusion.
- **MCP = donner accès AU MONDE.** Une connexion vers un service externe (base de données, Figma, navigateur, API métier).

## Les skills : ton savoir-faire encapsulé

Un skill est un dossier avec un `SKILL.md` : une description qui dit **quand** se déclencher, et des instructions qui disent **comment** faire. L'agent le charge à la demande (`/mon-skill`) ou automatiquement quand le contexte matche la description.

**Quand créer un skill : la règle des trois fois.** La première fois, tu expliques dans le prompt. La deuxième, tu re-expliques. La troisième, tu écris un skill et tu ne re-expliqueras plus jamais. Bons candidats : ton processus de mise en prod, ta façon de rédiger un rapport, ton rituel d'initialisation de projet.

**Ce qui fait un bon skill :**
- La **description** est le déclencheur : elle doit dire précisément quand l'utiliser ET quand ne pas l'utiliser. Une description vague = un skill qui se déclenche à contretemps ou jamais.
- Le corps est une procédure, pas une dissertation : étapes, critères, exemples.
- Un skill = un savoir-faire. Deux sujets, deux skills.

Ce kit en installe quatre : `demarrer-projet` (initialisation guidée), `designsense` (standards UI/UX), `take-your-time` (réflexion produit avant le code), `patterns` (conventions inter-projets).

## Les sous-agents : déléguer sans polluer

Un sous-agent part avec un contexte vierge, sa propre mission, et rend un rapport. Deux raisons de déléguer :

1. **Isoler le bruit** (chapitre 05) : une exploration massive reste dans le contexte du sous-agent, seul le résultat revient.
2. **Avoir un regard indépendant** : un relecteur qui n'a pas vu la conversation ne défend pas le code, il le juge. C'est toute la valeur des agents `qa`, `reviewer` et `security-auditor` du kit.

**Les règles qui évitent les ennuis :**
- **Relecteurs et chercheurs en lecture seule.** Un agent d'audit qui peut modifier les fichiers finit toujours par « réparer » ce qu'il devait juger. Les 6 agents du kit sont en lecture seule par construction.
- **Une mission bornée par agent.** « Vérifie que les routes API valident leurs inputs » fonctionne ; « améliore le projet » produit du chaos.
- **Paralléliser les travaux indépendants seulement.** Plusieurs agents qui écrivent du code sur le même sujet = hypothèses qui se contredisent. Plusieurs agents qui lisent des choses différentes = gain net.
- **Méfiance avec les verdicts complaisants.** Un agent relecteur tend à approuver. Demander la liste exhaustive des problèmes avec niveau de confiance, jamais un simple « c'est bon ? ».

## Les MCP : les accès externes

Un serveur MCP branche l'agent sur un service : lire ta base Supabase, piloter un navigateur, lire une maquette Figma, interroger une API interne. C'est puissant et ça a deux coûts : chaque serveur ajoute des outils dans le contexte (du poids permanent), et chaque accès est une surface de risque.

**Les règles :**
- **3 à 5 serveurs actifs maximum.** Au-delà, tu paies en tokens et en confusion d'outils à chaque session. Brancher ce qu'on utilise vraiment, débrancher le reste.
- **Le besoin d'abord.** On branche un MCP parce qu'un workflow réel le demande (vérifier l'app dans le navigateur, lire les maquettes), pas parce que la liste des serveurs disponibles fait envie.
- **Accès minimal.** Un MCP en lecture suffit souvent ; les écritures vers l'extérieur (poster, déployer, envoyer) méritent une confirmation à chaque fois.

## Comment choisir, en une question

« Est-ce que je veux que l'agent **sache faire** quelque chose (skill), qu'il **fasse faire** à un contexte isolé (sous-agent), ou qu'il **accède** à quelque chose (MCP) ? »

Exemple complet, une revue de design : le **skill** `designsense` fournit les standards (le savoir), le **sous-agent** `reviewer` applique la grille sans complaisance (le regard isolé), et un **MCP** navigateur affiche la vraie page (l'accès). Les trois se composent, aucun ne remplace l'autre.
