# 01. La philosophie du builder

## Le changement de rôle

Avec un agent qui code, tu ne deviens pas « développeur assisté ». Tu deviens autre chose : un **builder**. Tu décides quoi construire, tu cadres comment, tu vérifies que c'est fait. L'agent tape le code ; toi, tu portes la responsabilité du résultat.

C'est le même rapport qu'entre un directeur de travaux et ses corps de métier. Le directeur ne pose pas les briques, mais il sait lire un plan, il passe sur le chantier, et rien n'est réceptionné sans contrôle. Un builder qui ne vérifie rien n'est pas un builder, c'est un spectateur.

## Ce que tu dois savoir faire (et c'est tout)

1. **Formuler un problème.** Pas une solution technique : un problème, avec son contexte, ses utilisateurs, ce qui est hors scope. C'est la compétence numéro un, et elle ne s'automatise pas.
2. **Arbitrer.** L'agent te présentera des options avec des compromis (rapidité vs robustesse, simple vs flexible). Tu trancheras mieux que lui parce que tu connais ton contexte : budget, urgence, durée de vie du projet.
3. **Vérifier.** Tu n'as pas besoin de lire le code. Tu as besoin de constater le comportement : cliquer dans l'app, lire le résultat d'un test, comparer l'écran à ce que tu voulais. Le chapitre [04](04-verification.md) donne la checklist exacte.
4. **Dire stop.** Quand l'agent tourne en rond, quand la solution enfle, quand tu ne comprends plus ce qui se passe : arrêter, reformuler, repartir. C'est toi le pilote.

## Ce que tu n'es pas obligé de savoir

Lire chaque ligne de code, connaître les frameworks par cœur, déboguer à la main. En revanche, chaque concept que tu croises souvent (une API, une base de données, une migration) mérite que tu demandes une explication une fois. Pas pour coder toi-même : pour arbitrer en connaissance de cause. Un builder qui accumule ces compréhensions-là devient redoutable.

## Les trois pièges du builder

**Le piège de la confiance.** L'agent est convaincant par construction : il annonce « c'est fait » avec le même aplomb que ce soit vrai ou non. Ta parade : ne jamais accepter une affirmation sans preuve. Tests qui passent, écran vérifié, comportement constaté.

**Le piège de l'ambition.** L'agent dit rarement non. Tu demandes une feature, il en profite pour « améliorer » trois autres choses ; tu demandes un script, il livre une plateforme. Ta parade : exiger le minimum qui résout le problème, et une règle explicite dans ta config (« pas de code spéculatif, rien au-delà de la demande », voir chapitre [02](02-claude-md.md)).

**Le piège du spectateur.** Enchaîner les prompts sans jamais cadrer ni vérifier, et découvrir au bout de trois jours que l'édifice est bancal. Ta parade : le workflow du chapitre [03](03-workflow-feature.md), qui place tes points de contrôle aux bons endroits (avant le build : le plan ; après le build : la preuve).

## Le principe qui gouverne tout le reste

**Le système compte plus que le modèle.** Les retours d'expérience en production convergent : ce qui fait la différence sur la durée, ce n'est pas le dernier modèle à la mode, c'est l'architecture de travail. Des règles courtes et respectées, des vérifications automatiques, une mémoire bien tenue, des projets propres. Un modèle moyen dans un bon système bat un excellent modèle piloté n'importe comment.

C'est exactement ce que ce kit installe : le système. Le reste du playbook le détaille pièce par pièce.
