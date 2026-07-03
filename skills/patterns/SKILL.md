---
name: patterns
description: Bibliothèque de patterns / décisions / conventions RÉUTILISABLES, partagée entre TOUS les projets de l'utilisateur. Comble le trou de la mémoire native (qui est par-projet ET par-machine). Charger au début d'un projet, ou quand l'utilisateur dit « mes patterns », « comme d'habitude », « mes conventions ». Sauver quand une décision réutilisable émerge. Aussi : /patterns.
---

# /patterns — Mémoire transversale entre projets

**Le problème (vérifié, doc Anthropic mai 2026) :** la mémoire auto native est **par-projet** (dérivée du dépôt git) **et par-machine** (pas de cloud) → elle ne donne PAS un pool de savoir partagé entre projets. Dès qu'on démarre souvent de nouveaux projets, ou qu'on bosse sur plusieurs machines, il faut un store transversal.

**La solution :** `~/.claude/patterns/*.md` — un fichier court par thème (stack, conventions de code, déploiement, pièges récurrents, préférences UI…). Pour le multi-machine, versionner ce dossier dans un repo git perso et le réinstaller sur chaque machine.

## CANDIDATS — l'apprentissage continu

Un hook Stop léger (`suggest-patterns.sh`, installé par le kit : Haiku asynchrone, 1 analyse max par session de 10+ messages, ne bloque jamais la fin de tour) détecte les corrections/préférences RÉUTILISABLES exprimées par l'utilisateur en session et les APPEND dans `~/.claude/patterns/_candidats.md` (date, projet, verbatim, confiance). **Rien ne devient un pattern actif sans validation.**

À chaque LOAD de ce skill : si `_candidats.md` est non vide, présenter les candidats à l'utilisateur (les [haute] d'abord), et pour chacun : **PROMOUVOIR** (reformuler court, écrire dans le bon `<theme>.md`) ou **JETER**. Dans les deux cas, retirer la ligne traitée de `_candidats.md`. Si le fichier dépasse ~30 lignes sans review, proposer une passe de tri immédiate. Le schéma complet : [playbook/schemas.md](../../playbook/schemas.md), schémas 4 et 5.

## LOAD — quand lire le store
- Au **démarrage d'un nouveau projet** : lire `~/.claude/patterns/` et proposer ce qui s'applique (« d'habitude tu fais X — on garde ? »).
- Quand l'utilisateur dit « **mes patterns / mes habitudes / comme d'hab / mes conventions** ».
- Astuce auto : un projet peut ajouter `@~/.claude/patterns/<theme>.md` dans son `CLAUDE.md` pour charger un pattern automatiquement.

## SAVE — quand écrire dans le store
Quand une **décision/convention/snippet réutilisable** émerge qui vaudrait pour **d'autres** projets (choix de stack récurrent, structure de dossiers, piège évité, préférence forte). Écrire dans `~/.claude/patterns/<theme>.md`, court et actionnable.
- **Demander à l'utilisateur avant d'ajouter** un pattern (éviter le bloat).
- NE PAS y mettre du spécifique à UN projet (ça, c'est la mémoire/CLAUDE.md du projet).

## Règles
- **Court = suivi.** Comme les rules : un store gonflé est ignoré. Une ligne ou deux par pattern, pas des pavés.
- **Un thème = un fichier.** Ne pas tout entasser dans un seul.
- Si le store est synchronisé via un repo git (recommandé en multi-machine) : après ajout, reporter aussi le pattern dans le repo et commit (sinon il reste local à la machine).
