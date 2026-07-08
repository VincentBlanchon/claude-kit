# 07. Hooks et sécurité : l'enforcement automatique

## L'idée maîtresse : consigne < enforcement

Une règle écrite dans `CLAUDE.md` est une **consigne** : très bien suivie en temps normal, mais elle peut glisser (session longue, contexte saturé, formulation ambiguë). Un hook ou une permission est de l'**enforcement** : le système l'applique, l'agent ne peut pas l'oublier.

La différence tient en deux verbes. Une consigne, c'est « je demande ». Un hook, c'est « j'empêche ». Le CLAUDE.md énonce ; le hook exécute, à chaque fois, sans se fatiguer et sans exception. Une règle mécanique ne dépend ni de l'humeur du modèle, ni de la place qui reste dans le contexte.

La conséquence pratique : **tout ce qui peut être rendu mécanique doit l'être, et sort du CLAUDE.md.** « Toujours vérifier les types » est une consigne fragile ; un hook qui lance le typecheck à chaque fin de tour est un fait. Garde le CLAUDE.md pour ce qui demande du jugement, donne le reste à la machine.

## Les permissions : le premier rempart

Dans `settings.json`, trois niveaux, appliqués dans cet ordre : `deny` (bloqué, non négociable), `ask` (confirmation demandée), `allow` (silencieux). **Un deny ne peut être contourné ni par l'agent, ni par une instruction dans un fichier lu, ni par un prompt malveillant.** C'est le seul mécanisme qui a cette propriété : réserve-le à ce qui est grave.

Le kit installe cette base :

```json
{
  "permissions": {
    "deny": [
      "Read(**/.env*)",
      "Read(**/.ssh/**)",
      "Read(**/secrets/**)",
      "Bash(rm -rf /*)",
      "Bash(git push --force*)"
    ],
    "ask": ["Bash(git push*)", "Bash(rm *)", "WebFetch"]
  }
}
```

**Pourquoi bloquer la lecture des secrets** alors que « l'agent est de mon côté » : parce qu'un secret lu entre dans le contexte, et que le contexte finit dans des logs, des résumés, parfois du code généré. Un secret que l'agent n'a jamais vu ne peut fuir nulle part. Trois vecteurs à couvrir : la lecture directe (`.env`), la sortie d'exécution (des tests qui affichent les variables d'environnement : utiliser un `.env.test` avec des valeurs bidon), et les recherches qui matchent des secrets.

## Les hooks : des scripts aux moments clés

Un hook est un script branché sur un événement du cycle de vie : début de session, avant ou après chaque outil, fin de tour, compaction du contexte. Son code de sortie décide : `0` laisse passer, `2` bloque et renvoie le message à l'agent, qui doit s'y conformer. Certains hooks ne bloquent jamais : ils se contentent d'afficher un rappel ou un avertissement, ce qui est déjà utile.

**Le kit installe douze hooks.** C'est beaucoup, mais chacun couvre un moment précis, et la plupart sont muets tant que rien ne les concerne. On les regroupe ici en quatre familles pour rester lisible.

### Famille 1 : l'ouverture de session (savoir où on met les pieds)

Ces hooks tournent au démarrage. Leur but : t'éviter de commencer à travailler sur une base fausse (mauvaise branche, retard non synchronisé, travail oublié ailleurs).

| Hook | Événement | Ce qu'il fait | Pourquoi |
|---|---|---|---|
| `git-diagnostic.sh` | Début de session | Fait le point sur l'état du dépôt : fichiers modifiés non commités, retard ou avance sur le remote, branches d'agent (`claude/*`) non fusionnées, worktrees contenant du travail non commité. Muet si tout va bien. | Le travail qui « disparaît » vient presque toujours d'une branche ou d'un worktree oublié. Ce diagnostic le fait remonter à la surface avant que tu ne repartes de zéro. Aucun appel réseau : il lit l'état local, donc il est instantané. |
| `branch-guard.sh` | Début de session | Si le dépôt principal n'est **pas** sur sa branche principale (`main`/`master`) et que celle-ci a avancé, il l'affiche fort, avec la commande à lancer. Silencieux dans les worktrees (une branche dédiée y est normale). | Le piège classique : continuer sur une vieille branche figée, loin de l'état réel du projet, et bâtir sur du sable. L'alerte force le réflexe « je repars d'une base à jour ». |
| `rappels.sh` | Début de session | Rappels discrets, seulement s'il y a lieu : patterns candidats en attente de tri, nouvelle semaine de quota, configuration du kit en retard sur sa source, rituel d'entretien trimestriel dû. | Ce sont des choses qu'on doit faire mais auxquelles on ne pense jamais spontanément. Le hook y pense à ta place, sans jamais t'ensevelir sous les notifications. |

### Famille 2 : l'affichage (voir l'état réel)

| Hook | Événement | Ce qu'il fait | Pourquoi |
|---|---|---|---|
| `statusline.sh` | statusLine | Affiche en permanence : le modèle, le dossier courant, et une **jauge de remplissage du contexte** avec le pourcentage réel. Passe l'alerte « zone rouge » au-delà d'un seuil. | Le contexte qui déborde dégrade la qualité sans prévenir. Avant, on l'estimait au jugé ; ici on lit le vrai chiffre fourni par Claude Code, et on sait quand compacter ou repartir sur une session fraîche. |

### Famille 3 : les garde-fous avant action (empêcher le geste dangereux)

Ces hooks se déclenchent **avant** qu'un outil s'exécute. Ils bloquent (`exit 2`) quand ils reconnaissent un geste à risque. C'est ici que la promesse « j'empêche » prend tout son sens.

| Hook | Événement | Ce qu'il fait | Pourquoi |
|---|---|---|---|
| `block-dangerous-actions.sh` | Avant une commande shell | Bloque les commandes destructives : `rm -rf` sur la racine / le home / un wildcard, `git push --force` (sauf `--force-with-lease`), `git clean -f`, un `kill` par motif (`killall`/`pkill`), et le SQL destructif (`DROP`/`TRUNCATE`/`DELETE` sans `WHERE`) **uniquement** quand il passe par un vrai client de base de données. | Une seule de ces commandes peut effacer des heures de travail ou des données réelles. Le filtrage par vrai client DB évite les faux positifs sur un simple `echo` ou une doc. Quand ça bloque, l'agent reçoit la raison et la marche à suivre : demander à l'humain de la lancer lui-même s'il le faut vraiment. |
| `block-no-verify.sh` | Avant une commande shell | Interdit le drapeau `--no-verify` sur les commandes git. | `--no-verify` désactive les hooks git (pre-commit, etc.). C'est la porte dérobée qui permettrait de contourner tous les autres garde-fous. Si un hook échoue, on corrige la cause, on ne la court-circuite pas. |
| `block-preview-panel.sh` | Avant un outil | Bloque le panneau preview intégré au profit d'un vrai navigateur. Ne cible que les outils visuels (capture, clic, etc.) ; les outils de pur debug (logs, réseau) restent utilisables. | Une interface se valide dans un vrai navigateur : vrai moteur de rendu, vraies polices, vrai comportement responsive. L'aperçu intégré peut mentir sur le rendu final et donne une fausse confiance. Le hook renvoie la marche à suivre : lancer le dev server, ouvrir dans le navigateur, screenshot. |

### Famille 4 : après coup et fin de parcours (rattraper, préserver, apprendre)

Ces hooks se déclenchent après une édition, à la compaction, ou en fin de tour.

| Hook | Événement | Ce qu'il fait | Pourquoi |
|---|---|---|---|
| `lint-format.sh` | Après une écriture de fichier | Formate le fichier qui vient d'être touché (biome ou prettier selon le projet, en local uniquement). Optimisé pour être quasi instantané ; s'il ne trouve pas de formateur local, il ne fait rien. | Le formatage est une règle qu'on ne devrait jamais avoir à énoncer : c'est purement mécanique. Le faire à chaque édition évite les diffs pollués par des histoires d'espaces et de virgules. |
| `warn-frontend-slop.sh` | Après une écriture de fichier front | **Alerte sans bloquer** quand il détecte les marqueurs d'une interface générique « faite par une IA » : police Inter par défaut, dégradés violet/indigo, glassmorphism systématique (`backdrop-blur`). | Ces trois tells trahissent le rendu générique qu'on veut éviter. Le hook les attrape à chaque édition, même quand le skill de design n'est pas chargé. Il n'empêche rien : si c'est un choix délibéré de la direction artistique, on ignore ; sinon on corrige avant de livrer. |
| `precompact-directive.sh` | Avant la compaction du contexte | Impose au résumé de compaction de préserver, en tête : la tâche en cours, le plan validé et l'étape courante, les décisions et interdits posés par l'humain, l'état prouvé (fait vs simplement écrit), et les chemins de fichiers en cours de modification. | Une compaction sans consigne perd systématiquement quelque chose d'important : c'était la cause des reprises de session laborieuses. Cette directive garantit que la colonne vertébrale du travail survit à la compression. |
| `typecheck-on-stop.sh` | Fin de tour | Lance un typecheck complet et le compare à une **baseline stockée par dépôt**. Ne bloque que si l'agent a introduit de **nouvelles** erreurs ; les erreurs préexistantes ne comptent pas. Si le nombre baisse, la baseline descend et ne peut plus remonter. | C'est l'enforcement intelligent : un cliquet, pas un mur. Exiger zéro erreur sur un projet qui en traîne 50 bloquerait tout ; exiger « pas une de plus » fait progresser sans paralyser. Il se met en veille tout seul si les dépendances ne sont pas installées, pour ne pas crier au loup sur de faux « module introuvable ». |
| `suggest-patterns.sh` | Fin de tour | **Apprentissage continu, en tâche de fond.** En fin de session, un petit modèle relit tes messages et propose zéro à trois « patterns candidats » (corrections, préférences ou interdits réutilisables) dans un fichier d'attente. N'écrit **jamais** directement dans les règles actives. | Les bonnes façons de travailler émergent au fil des sessions et se perdent si personne ne les note. Ce hook les capture automatiquement, sans jamais bloquer (il tourne en asynchrone) et sans jamais décider à ta place : c'est toi qui promeus ou jettes les candidats plus tard, via le skill dédié. |

## Écrire son propre hook : les deux pièges

1. **Les données arrivent sur stdin en JSON**, pas en variables d'environnement. Le pattern correct :
```bash
input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
```
2. **Un hook lent se paie à chaque déclenchement.** Au-delà d'une seconde ou deux, il dégrade toute la session : garder les hooks rapides, et tester en isolement (`echo '{"tool_input":{"file_path":"/tmp/t.ts"}}' | bash mon-hook.sh`).

## Les trois profils, selon l'enjeu

- **Minimal** (tout projet, même non-code) : diagnostic git et garde-fou de branche à l'ouverture, rappels, jauge de contexte.
- **Standard** (projet code, ce que le kit installe) : minimal + formatage automatique + blocage des commandes dangereuses et de `--no-verify` + directive de compaction + typecheck en fin de tour + apprentissage des patterns.
- **Strict** (production, données réelles) : standard + scan de secrets en pre-commit + revue sécurité obligatoire avant merge (agent `security-auditor`).

## L'hygiène de base, hooks ou pas

- Jamais de secret dans le code ni dans un fichier versionné : variables d'environnement, point.
- Valider toute entrée externe (formulaires, webhooks, paramètres d'URL) côté serveur.
- Vérification d'authentification au début de chaque route API, pas « plus tard ».
- Pas de données sensibles dans les logs.
- **Vetting des serveurs MCP** : un MCP est du code tiers qui accède à ton contexte et à tes outils. N'installe que des serveurs dont tu connais la source, et n'accorde que les permissions nécessaires. Un MCP douteux est un vecteur d'exfiltration au même titre qu'une dépendance non auditée.

Ces règles vivent dans `rules/securite.md` (installé par le kit) et l'agent `security-auditor` les contrôle avant les merges sensibles.
