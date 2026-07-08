# 05. Contexte et mémoire

## Pourquoi les sessions se dégradent

Le contexte d'un agent est sa mémoire de travail : tout ce qui a été dit, lu et produit dans la session. Deux phénomènes le dégradent :

1. **La saturation.** Même avec des fenêtres énormes, la qualité baisse bien avant la limite théorique : le « context rot » se fait sentir dès que la session accumule des centaines de milliers de tokens de bruit (fichiers lus pour rien, tentatives ratées, digressions).
2. **La pollution.** Une mauvaise piste explorée puis abandonnée reste dans le contexte et continue d'influencer la suite. L'agent « se souvient » de son erreur comme si elle était pertinente.

Symptômes : réponses plus vagues, oublis de règles pourtant écrites, retours en arrière inexpliqués, vitesse en berne. Quand tu les vois, le problème n'est pas le modèle, c'est la session.

**La règle opérationnelle chiffrée** (recoupée par les power users et la doc officielle) : vers **40 % de contexte utilisé**, tu entres en zone rouge. Aucune tâche lourde ne DÉMARRE au-delà de ce seuil : on clôture proprement et on repart frais. La statusline de Claude Code affiche ce pourcentage : regarde-le comme une jauge d'essence.

## Le pourcentage se lit, il ne s'invente pas

Un piège discret mais coûteux : l'agent a tendance à estimer son remplissage « au jugé ». Il annonce « on est à 40 % » sans l'avoir mesuré. Il se trompe presque toujours. Deux dégâts opposés : soit il sur-estime et te fait couper une session encore fraîche, soit il sous-estime et laisse la session pourrir bien après la zone rouge.

La règle : **ne jamais annoncer un pourcentage de contexte qu'on n'a pas mesuré.** Et l'agent PEUT le mesurer, tout seul. Deux sources fiables du même chiffre réel (`context_window.used_percentage`, fourni par Claude Code) :
1. **La statusline** (`statusline.sh`), affichée en continu dans TON terminal : ta jauge à toi, comme une jauge d'essence.
2. **Le script `hooks/context-usage.sh`**, que l'agent lance quand la question se pose : il lit le dernier `usage` du transcript de session (tokens réellement en contexte) et sort le chiffre, sans recharger le transcript. C'est ce qui rend l'agent autonome sur sa propre jauge.

Nuance à comprendre : la statusline s'affiche pour toi, elle n'est pas réinjectée dans le contexte de l'agent (il ne « voit » pas la barre en direct). C'est justement pour ça que le script existe : au lieu de deviner ou de te renvoyer la question, l'agent lance `context-usage.sh` et lit le vrai nombre. Il mesure, il n'invente plus. La décision de changer de session se prend alors sur du concret : une FIN DE PHASE (une étape finie, une feature mergée) plus le chiffre mesuré.

Le seuil zone rouge reste le repère : ne pas démarrer une grosse tâche quand la jauge est haute, compacter en fin de phase.

## Les 4 gestes de gestion de session

**1. `/clear` : nouvelle tâche, nouvelle session.** Le geste par défaut. Une session = une tâche. Repartir propre coûte 30 secondes de re-cadrage et rend des heures de lucidité.

**2. Le rewind : revenir en arrière au bon endroit.** Quand une approche échoue, ne pas empiler des correctifs par-dessus : revenir au message d'avant la mauvaise piste et re-prompter avec l'interdiction explicite (« n'utilise pas l'approche A, pars sur B »). La mauvaise piste disparaît du contexte au lieu de le hanter.

**3. `/compact` : compresser en donnant la direction.** Le résumé automatique ne sait pas ce qui comptera pour TA suite. Compacter manuellement, en précisant : « compacte en gardant : le plan validé, les décisions prises, l'état des tests ; la suite sera l'implémentation de l'étape 3 ». Un compact sans direction perd systématiquement quelque chose d'important.

**4. Les sous-agents : isoler le bruit.** Une recherche large (explorer 30 fichiers, comparer des libs) génère énormément de tokens intermédiaires inutiles ensuite. La déléguer à un sous-agent, c'est garder la conclusion et jeter le bruit : son contexte meurt avec lui, seul son rapport revient.

## La reprise de session

Le piège du quotidien : reprendre le travail d'hier et re-expliquer le contexte de mémoire, en en oubliant la moitié. Trois parades, par ordre de robustesse :

1. **L'état écrit dans le repo.** En fin de session significative, faire consigner l'état dans un fichier (`docs/etat.md` ou une note de PR) : fait, en cours, décisions, prochaine étape. La session suivante commence par « lis docs/etat.md et confirme-moi où on en est ».
2. **La mémoire native.** Claude Code entretient une mémoire par projet. Elle est bonne pour les faits durables (préférences, conventions, contraintes), pas pour l'état fin d'une tâche en cours : ne compte pas sur elle pour « où j'en étais hier soir ».
3. **Le résumé de sortie.** Avant de fermer une session, demander : « résume ce qu'on a fait et ce qu'il reste, en 10 lignes, pour la prochaine session ». Coller ce résumé en ouverture de la suivante.

## La mémoire longue : du markdown, pas de l'infrastructure

Pour la connaissance qui doit survivre aux sessions et aux projets, la solution la plus robuste est aussi la plus simple : **des fichiers markdown dans un repo git**.

- **Par projet** : `CLAUDE.md` (règles), `docs/` (décisions, vision, état).
- **Inter-projets** : `~/.claude/patterns/` (tes conventions réutilisables ; le skill `patterns` du kit gère le rituel lecture/écriture).
- **Ta veille et tes connaissances** : un repo dédié, un fichier par sujet, un index. L'agent le lit très bien, git le versionne, et ça se synchronise entre machines sans aucune infrastructure.

Méfie-toi des systèmes de mémoire miracle (plugins qui promettent de tout retenir pour rien) : en pratique ils ajoutent des tokens plus souvent qu'ils n'en économisent, et une mémoire qui accumule sans purge devient toxique, elle ressort des faits périmés avec l'autorité du vrai. Une mémoire utile est une mémoire **entretenue** : on y écrit peu, on la relit, on purge ce qui est mort.
