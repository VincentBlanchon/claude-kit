# Sous le capot : le système en schémas

Une carte d'ensemble d'abord, puis neuf schémas qui montrent PRÉCISÉMENT ce qui se passe à chaque moment : ce qui se charge, ce qui bloque, ce qui vérifie, ce qui apprend. À lire avec le [playbook](README.md) ; chaque schéma renvoie au chapitre qui l'explique.

## Vue d'ensemble : la carte du système

![Carte du système : du repo à la config active, et les six briques qui la composent](../assets/carte-systeme.svg)

Le repo s'installe dans `~/.claude` via `./install.sh`, qui déploie six briques chargées à chaque session. Les hooks empêchent (automatique, déterministe), le CLAUDE.md guide (règles à suivre). Les neuf schémas ci-dessous détaillent chaque moment.

## 1. Ce qui se charge à l'ouverture d'une session

Tout ne charge pas tout le temps : c'est ce qui garde les sessions rapides et le budget sous contrôle (chapitre [10](10-modeles-et-couts.md)).

```mermaid
flowchart TB
    START([claude démarre dans un dossier]) --> SET["settings.json<br/>permissions deny/ask/allow + hooks ARMÉS<br/>(pas encore exécutés, juste branchés)"]
    SET --> GCM["~/.claude/CLAUDE.md<br/>règles globales : TOUJOURS chargé"]
    GCM --> RULES{"rules/ : frontmatter<br/>paths: [...] ?"}
    RULES -- "rule sans paths<br/>(git-workflow, verification)" --> LOAD1["chargée TOUJOURS"]
    RULES -- "rule scopée code<br/>(qualite, securite, frontend)" --> LOAD2["chargée SEULEMENT si la session<br/>touche des fichiers qui matchent"]
    LOAD1 --> PCM["CLAUDE.md du projet<br/>+ mémoire projet (si existante)"]
    LOAD2 --> PCM
    PCM --> SKILLS["skills/ : SEULES les descriptions chargent.<br/>Le corps d'un skill ne charge que si la situation<br/>matche sa description (ou /commande à la main)"]
    SKILLS --> HOOK1["hook SessionStart : git-diagnostic<br/>(schéma 8) affiche les alertes s'il y en a"]
    HOOK1 --> READY([Session prête])
```

Conséquence pratique : une règle mal placée (tout dans le CLAUDE.md global) coûte des tokens à CHAQUE message de CHAQUE session. Une règle scopée ou un skill ne coûtent que quand ils servent.

## 2. Une commande dangereuse est tentée

Le chapitre [07](07-hooks-et-securite.md) explique pourquoi l'enforcement bat la consigne. Voici la mécanique exacte :

```mermaid
sequenceDiagram
    participant A as Agent
    participant H as Harness (Claude Code)
    participant K as Hook PreToolUse<br/>block-dangerous-actions.sh
    participant S as Shell

    A->>H: Bash("pkill -9 node")
    H->>K: stdin JSON {tool_input: {command: "pkill -9 node"}}
    K->>K: match motif interdit<br/>(kill par pattern)
    K-->>H: exit 2 + message sur stderr
    Note over K,H: "COMMANDE BLOQUÉE : identifier le PID exact,<br/>confirmer, kill ciblé"
    H-->>A: la commande N'A PAS tourné,<br/>voici la raison
    A->>H: Bash("lsof -i :3000") puis kill ciblé confirmé
    H->>S: exécution (aucun motif ne matche)
    S-->>A: résultat
```

Le point clé : l'agent ne peut pas « oublier » cette règle, elle ne vit pas dans sa mémoire mais dans le système. Même chose pour `--no-verify`, le force push, `git clean -f`, le SQL destructif via client DB, et la lecture des fichiers de secrets (bloquée encore plus tôt, par les permissions).

## 3. Le cycle d'une feature, avec les deux points de contrôle

Le chapitre [03](03-workflow-feature.md) en prose ; ici le circuit :

```mermaid
flowchart LR
    A[Besoin exprimé] --> B{Clair ?}
    B -- non --> Q[Questions] --> B
    B -- oui --> P["Plan : étapes +<br/>critère de vérif chacune,<br/>zéro placeholder"]
    P --> G1{{"GATE 1<br/>plan VALIDÉ puis VERROUILLÉ<br/>par l'humain"}}
    G1 --> BR[branche feat/x] --> IMPL["Construction étape par étape<br/>1 phase par conversation<br/>1 tâche lourde à la fois"]
    IMPL --> QA["Machine : lint à chaque édition,<br/>typecheck en fin de tour, tests"]
    QA --> REV["Si code à risque :<br/>review adversariale + audit sécurité<br/>(agents en lecture seule)"]
    REV --> G2{{"GATE 2<br/>PREUVE : tests lus + vrai navigateur<br/>desktop, mobile, états oubliés"}}
    G2 -- validé --> MERGE[PR courte, merge,<br/>branche SUPPRIMÉE]
    IMPL -. "2e fix raté : session fraîche<br/>3e échec : on questionne l'architecture" .-> P
```

## 4. Ce qui se passe à CHAQUE fin de tour (hooks Stop)

Deux hooks tournent quand l'agent termine, avec deux philosophies différentes : l'un peut bloquer, l'autre ne bloque jamais.

```mermaid
sequenceDiagram
    participant A as Agent (fin de tour)
    participant T as typecheck-on-stop.sh
    participant L as suggest-patterns.sh
    participant BG as Fond (async)

    A->>T: le tour se termine
    T->>T: tsc --noEmit,<br/>comparé à la BASELINE du repo
    alt nouvelles erreurs introduites
        T-->>A: exit 2 : "corrige avant de t'arrêter"
        A->>A: corrige, retente le stop
    else pas de régression
        T-->>A: exit 0 (les erreurs préexistantes<br/>ne bloquent pas : cliquet, pas mur)
    end
    A->>L: même fin de tour
    L->>L: session ≥ 10 messages ?<br/>déjà analysée ? (marqueur)
    L-->>A: exit 0 IMMÉDIAT (jamais d'attente)
    L->>BG: fork : Haiku relit les messages humains
    BG->>BG: extrait 0-3 corrections RÉUTILISABLES
    BG->>BG: append dans patterns/_candidats.md
```

## 5. La boucle d'apprentissage : de la correction au pattern permanent

La suite du schéma 4 : ce que deviennent les candidats (chapitre [05](05-contexte-et-memoire.md) pour la philosophie mémoire).

```mermaid
flowchart LR
    C["Tu corriges l'agent en session<br/>(préférence, interdit, façon de faire)"] --> H["Hook Stop async<br/>+ Haiku (schéma 4)"]
    H --> CAND["patterns/_candidats.md<br/>date, projet, verbatim, confiance"]
    CAND --> LOAD["Prochain chargement<br/>du skill patterns"]
    LOAD --> DEC{"TOI tu juges<br/>chaque candidat"}
    DEC -- promouvoir --> ACT["patterns/&lt;theme&gt;.md<br/>= pattern ACTIF"]
    DEC -- jeter --> POUB[supprimé]
    ACT --> ALL["Toutes les sessions futures<br/>le proposent d'office"]
    ALL -. "tu ne re-corriges<br/>plus jamais ça" .-> C
```

La règle absolue : **rien ne devient un pattern actif sans validation humaine**. Une mémoire qui s'écrit toute seule accumule du faux avec l'autorité du vrai.

## 6. La discipline de contexte, chiffrée

Pourquoi les sessions se dégradent et quoi faire à chaque seuil (chapitre [05](05-contexte-et-memoire.md)) :

```mermaid
flowchart TB
    subgraph SESSION[" une session "]
        V["0 à ~40% de contexte<br/>ZONE SAINE : tout est permis"]
        R["au-delà de ~40%<br/>ZONE ROUGE : la qualité chute<br/>mesurablement"]
        V -->|le travail s'accumule| R
    end
    R --> D{Que faire ?}
    D -- "nouvelle tâche" --> CLEAR["/clear : session fraîche<br/>+ résumé de reprise"]
    D -- "même tâche, phase finie" --> COMP["/compact MANUEL<br/>en donnant la direction"]
    D -- "mauvaise piste explorée" --> REW["/rewind au message d'avant<br/>la piste + interdiction explicite"]
    COMP --> PC["Hook PreCompact : la directive impose<br/>de préserver tâche en cours, plan,<br/>décisions, preuves, fichiers ouverts"]
    ECHEC["2e fix raté sur le même bug"] --> CLEAR
```

## 7. « C'est fait » : l'arbre de la preuve

La règle du chapitre [04](04-verification.md), en logique exécutable :

```mermaid
flowchart TB
    CLAIM["L'agent veut dire « c'est fait »"] --> Q1{"Quelle commande/action<br/>PROUVE cette affirmation ?"}
    Q1 -- "aucune identifiable" --> STOP1["Ce n'est pas fini.<br/>C'est « en cours »."]
    Q1 -- identifiée --> RUN["L'exécuter FRAÎCHE<br/>(pas un résultat d'il y a 20 min)"]
    RUN --> READ["Lire TOUTE la sortie"]
    READ --> Q2{"C'est une UI ?"}
    Q2 -- oui --> UI["VRAI navigateur :<br/>desktop ~1440, mobile ~375,<br/>états vide/erreur/chargement"]
    Q2 -- non --> Q3
    UI --> Q3{"Un agent/workflow<br/>a produit le travail ?"}
    Q3 -- oui --> DIFF["Vérifier SON DIFF (git diff),<br/>jamais son rapport"]
    Q3 -- non --> OK
    DIFF --> OK["Affirmer, preuve à l'appui"]
```

## 8. L'ouverture de session côté git : les trois détections

Le hook `git-diagnostic.sh` (chapitre [08](08-git-discipline.md)) attrape les trois façons dont du travail se perd :

```mermaid
flowchart TB
    OPEN([Ouverture de session]) --> GD[git-diagnostic.sh]
    GD --> C1{"En retard sur<br/>le remote ?"}
    GD --> C2{"Branches d'agent<br/>non mergées ?"}
    GD --> C3{"Worktrees avec travail<br/>NON COMMITÉ ?"}
    C1 -- oui --> A1["« git pull avant de travailler »<br/>sinon : comparaison à un état FAUX,<br/>travail refait en double"]
    C2 -- oui --> A2["« du travail dort peut-être là »<br/>merger ou jeter AVANT<br/>tout état des lieux"]
    C3 -- oui --> A3["« invisible depuis ici »<br/>le pire des trois : même git status<br/>ne le montre pas depuis le repo principal"]
    C1 & C2 & C3 -- "tout est propre" --> SILENT["Le hook reste MUET<br/>(une alerte qui crie tout le temps<br/>finit ignorée)"]
```

## 9. L'installeur : pourquoi il ne peut rien casser

`./install.sh` (voir [README](../README.md)) applique la même décision à chaque fichier :

```mermaid
flowchart TB
    F["Pour CHAQUE fichier du kit"] --> E{"Existe déjà<br/>dans ~/.claude ?"}
    E -- non --> I["INSTALL : copié"]
    E -- oui --> ID{"Identique<br/>au kit ?"}
    ID -- oui --> N["rien à faire<br/>(silencieux)"]
    ID -- non --> FO{"--force ?"}
    FO -- non --> S["SKIP : ta version est conservée,<br/>signalée dans le rapport final"]
    FO -- oui --> O["écrasé par la version du kit"]
    I & N & S & O --> R["Rapport : N installés,<br/>N ignorés, N écrasés"]
```

C'est ce qui rend le kit installable sur une machine déjà configurée : par défaut, il complète, il n'écrase jamais.

---

*Si un schéma ne correspond plus au comportement réel du kit, c'est un bug de documentation : ouvre une issue ou corrige le schéma.*
