#!/usr/bin/env bash
# git-diagnostic.sh — hook SessionStart (claude-kit)
# Diagnostic git du repo courant a l'ouverture de session.
# Muet si tout va bien ; n'affiche que ce qui demande une action.
# Zero appel reseau (utilise l'etat local du remote).

set -euo pipefail

# Pas un repo git : proposer l'initialisation si le dossier semble vierge.
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ ! -f "CLAUDE.md" ] && [ -z "$(ls -A 2>/dev/null | grep -v '^\.' | head -1)" ]; then
    echo "[git-diagnostic] Dossier vierge : /demarrer-projet est disponible pour initialiser proprement."
  fi
  exit 0
fi

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
alerts=""

# Working tree sale ?
dirty=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
if [ "$dirty" -gt 0 ]; then
  alerts="${alerts}[git-diagnostic] ${dirty} fichier(s) modifie(s) non commite(s) sur '${branch}'.\n"
fi

# Retard / avance sur le remote suivi (etat local, pas de fetch).
upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)
if [ -n "$upstream" ]; then
  behind=$(git rev-list --count HEAD.."$upstream" 2>/dev/null || echo 0)
  ahead=$(git rev-list --count "$upstream"..HEAD 2>/dev/null || echo 0)
  [ "$behind" -gt 0 ] && alerts="${alerts}[git-diagnostic] En retard de ${behind} commit(s) sur ${upstream} : penser a pull avant de travailler.\n"
  [ "$ahead" -gt 0 ] && alerts="${alerts}[git-diagnostic] ${ahead} commit(s) locaux non pousses vers ${upstream}.\n"
fi

# Branches d'agent fantomes (claude/*) non mergees dans la branche par defaut.
default_branch=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's|origin/||' || echo "main")
if git show-ref --verify --quiet "refs/heads/${default_branch}"; then
  ghosts=$(git branch --no-merged "$default_branch" 2>/dev/null | grep -c 'claude/' || true)
  if [ "${ghosts:-0}" -gt 0 ]; then
    alerts="${alerts}[git-diagnostic] ${ghosts} branche(s) claude/* non mergee(s) dans ${default_branch} : du travail dort peut-etre la (git branch --no-merged ${default_branch}).\n"
  fi
fi

if [ -n "$alerts" ]; then
  printf "%b" "$alerts"
fi

exit 0
