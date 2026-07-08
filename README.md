# claude-kit

Une configuration complète et une méthode de travail pour Claude Code, prêtes à installer.

Ce repo condense plusieurs années de pratique intensive des agents IA : comment les piloter, comment obtenir du code fiable sans lire chaque ligne, comment éviter les pièges classiques (contexte qui pourrit, vérifications bâclées, interfaces génériques, budgets tokens explosés). Tout est en français, tout est actionnable.

## À qui ça s'adresse

- **Débutant total** (stagiaire, ami qui découvre) : suis [GUIDE-DEMARRAGE.md](GUIDE-DEMARRAGE.md), installe, et tu pars avec des rails solides au lieu d'une page blanche.
- **Utilisateur déjà actif** : pioche dans le [playbook](playbook/README.md), les [hooks](hooks/) et les [agents](agents/) ce qui manque à ta config.

Le principe central : **tu n'as pas besoin d'être développeur pour produire du bon logiciel avec un agent. Tu as besoin d'une méthode.** Ce kit est cette méthode, plus la config qui la fait respecter automatiquement.

## Installation

```bash
git clone https://github.com/VincentBlanchon/claude-kit.git
cd claude-kit
./install.sh
```

L'installation est **non-destructive** : elle n'écrase jamais un fichier existant (elle le signale et te laisse décider). Options : `./install.sh --dry-run` pour voir ce qui serait fait, `./install.sh --force` pour tout écraser en connaissance de cause.

## Ce qu'il y a dedans

![Carte du système : du repo à la config active, et les six briques qui la composent](assets/carte-systeme.svg)

| Dossier | Contenu | Installé vers |
|---|---|---|
| [playbook/](playbook/README.md) | La méthode en 10 chapitres + [9 schémas mermaid](playbook/schemas.md) qui montrent précisément ce qui se passe sous le capot | (lecture, pas installé) |
| [config/](config/) | `CLAUDE.md` global de départ, `settings.json` de base (secrets bloqués), 5 règles toujours chargées | `~/.claude/` |
| [skills/](skills/) | `demarrer-projet` (initialisation guidée), `designsense` (692 règles UI/UX anti-générique), `take-your-time` (réflexion produit avant le code), `patterns` (conventions inter-projets) | `~/.claude/skills/` |
| [agents/](agents/) | 6 sous-agents spécialisés en lecture seule : architecte, QA, reviewer design, auditeur sécurité, conseiller stack, roadmap | `~/.claude/agents/` |
| [hooks/](hooks/) | 12 scripts d'enforcement : diagnostic git à l'ouverture (retard, branches fantômes, worktrees oubliés), garde-fou de branche, statusline (jauge de contexte réelle), lint/format après édition, blocage `--no-verify`, commandes destructives et panneau preview intégré, typecheck à l'arrêt, directive de compaction, alerte anti-slop front, apprentissage continu | `~/.claude/hooks/` |
| [templates/](templates/) | `CLAUDE.md` projet, `settings.json` projet, template d'agent | (copiés par `demarrer-projet`) |

## La philosophie en 5 points

1. **Réfléchir avant de coder.** Les hypothèses se disent à voix haute, les ambiguïtés se lèvent avant, pas pendant. Un plan validé, puis on construit.
2. **La simplicité d'abord.** Le minimum de code qui résout le problème. Rien de spéculatif, pas d'abstraction pour un usage unique.
3. **La preuve ou rien.** « C'est fait » sans test qui passe et sans vérification dans un vrai navigateur, ça n'existe pas. Le playbook fournit la checklist.
4. **L'enforcement bat la consigne.** Une règle écrite dans un fichier peut être oubliée sous pression ; un hook ou une permission `deny` ne peut pas. Ce kit installe les deux.
5. **Le système compte plus que le modèle.** Une bonne config, des règles courtes, une mémoire bien tenue et des vérifications systématiques produisent plus que n'importe quel changement de modèle.

Le détail, les sources et les cas limites sont dans le [playbook](playbook/README.md).

## Structure après installation

```
~/.claude/
├── CLAUDE.md          ← règles globales (comportement de l'agent, tous projets)
├── settings.json      ← permissions (secrets bloqués) + hooks câblés
├── rules/             ← 5 règles courtes toujours chargées
├── skills/            ← workflows invocables (/demarrer-projet, designsense…)
├── agents/            ← sous-agents spécialisés (relecture, audit, plan)
├── hooks/             ← scripts d'enforcement (lint, typecheck, git)
└── patterns/          ← tes conventions personnelles (vide au départ, à toi de le remplir)
```

## Maintenu par

Vincent Blanchon. Ce kit est la version partageable de ma configuration personnelle : tout ce qui est ici est générique et testé en conditions réelles sur une quinzaine de projets (produits web, pipelines de données, automatisations, apps mobiles).

Licence [MIT](LICENSE) : sers-toi, adapte, partage.
