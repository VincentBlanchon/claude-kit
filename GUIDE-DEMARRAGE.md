# Guide de démarrage

Tu pars de zéro. À la fin de ce guide, tu as Claude Code installé, configuré avec ce kit, et ton premier projet lancé proprement. Compte 20 minutes.

## 1. Installer Claude Code

Il te faut un compte Claude (abonnement Pro ou Max, ou une clé API). Puis :

```bash
# macOS / Linux
curl -fsSL https://claude.ai/install.sh | bash
```

Vérifie : `claude --version`. Au premier lancement, `claude` te fait passer par l'authentification.

Claude Code existe aussi en app desktop (Mac/Windows) et en extension VS Code / JetBrains. Le kit fonctionne pareil partout : il configure ton dossier `~/.claude/`, que toutes les interfaces lisent.

## 2. Installer le kit

```bash
git clone https://github.com/VincentBlanchon/claude-kit.git
cd claude-kit
./install.sh
```

Le script affiche ce qu'il installe et ce qu'il saute (il ne remplace jamais un fichier que tu as déjà, sauf si tu passes `--force`). Relance-le après chaque `git pull` pour récupérer les mises à jour.

## 3. Comprendre ce que tu viens d'installer

Trois étages, du plus doux au plus dur :

1. **Des instructions** (`CLAUDE.md`, `rules/`) : la façon de travailler demandée à l'agent. Réfléchir avant de coder, rester simple, prouver que ça marche. L'agent les suit très bien, mais sous pression (longue session, contexte chargé) une consigne peut glisser.
2. **Des outils** (`skills/`, `agents/`) : des workflows que l'agent charge quand c'est pertinent. `demarrer-projet` pour initialiser proprement, `designsense` pour ne pas produire une interface générique, les sous-agents pour relire, auditer, planifier.
3. **De l'enforcement** (`settings.json`, `hooks/`) : ce qui ne dépend PAS de la bonne volonté de l'agent. Lecture des fichiers de secrets bloquée, `--no-verify` refusé, typecheck exécuté à la fin de chaque tour. Une machine vérifie, pas une promesse.

Cette hiérarchie (consigne < outil < enforcement) est l'idée la plus importante du kit. Le chapitre [07-hooks-et-securite](playbook/07-hooks-et-securite.md) l'explique en détail.

## 4. Ton premier projet

Dans un dossier vide :

```bash
mkdir mon-projet && cd mon-projet
claude
```

Puis tape :

```
/demarrer-projet
```

Le skill te pose les bonnes questions (quel problème, pour qui, quel scope minimal), te propose une stack adaptée à ton niveau, crée le `CLAUDE.md` du projet, le git, et la structure de départ. Ne saute pas les questions : dix minutes de cadrage économisent des heures de reprises.

## 5. Les 5 réflexes qui changent tout

1. **Décris le problème, pas la solution.** « Les utilisateurs doivent pouvoir retrouver une commande passée » vaut mieux que « ajoute un champ de recherche dans la navbar ». L'agent propose alors des options auxquelles tu n'aurais pas pensé.
2. **Valide le plan avant le code.** Pour tout ce qui dépasse la retouche : demande le plan, lis-le, ajuste-le, PUIS lance la construction. Un plan verrouillé = pas de dérive.
3. **Exige la preuve.** Quand l'agent dit « c'est fait », demande : quels tests passent, et montre-moi l'écran dans un vrai navigateur. Le kit installe un typecheck automatique, mais la vérification visuelle et fonctionnelle reste ta responsabilité de pilote.
4. **Une tâche = une session.** Nouvelle tâche, nouvelle session (`/clear`). Une session interminable accumule du bruit et dégrade la qualité des réponses.
5. **Termine tes branches.** Chaque session de travail finit par : commit, push, PR, merge (ou suppression). Les branches d'agent qui traînent créent de faux états et des doublons de travail.

## 6. Et ensuite

- Lis le [playbook](playbook/README.md) chapitre par chapitre, dans l'ordre. Chaque chapitre fait moins de 10 minutes.
- Le chapitre [01-philosophie-builder](playbook/01-philosophie-builder.md) d'abord : il définit ton rôle exact quand c'est l'agent qui écrit le code.
- Quand une convention personnelle émerge (ta stack préférée, tes conventions de nommage), range-la dans `~/.claude/patterns/` : l'agent te la ressortira au prochain projet.

## Dépannage express

| Symptôme | Cause probable | Fix |
|---|---|---|
| L'agent ignore une règle du CLAUDE.md | Fichier trop long ou règle noyée | Moins de 200 lignes, une douzaine de règles max, reformule en impératif |
| « Permission denied » sur un hook | Script non exécutable | `chmod +x ~/.claude/hooks/*.sh` |
| L'agent lit un `.env` | settings.json pas installé | Relance `./install.sh`, vérifie `~/.claude/settings.json` (bloc `deny`) |
| Réponses qui se dégradent en fin de session | Contexte saturé | `/clear` et repartir avec un résumé, voir chapitre [05](playbook/05-contexte-et-memoire.md) |
