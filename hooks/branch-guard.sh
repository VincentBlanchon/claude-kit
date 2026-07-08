#!/usr/bin/env bash
# branch-guard.sh, hook SessionStart (claude-kit)
# Garde-fou de branche : au demarrage, si le repo principal n'est PAS sur sa
# branche principale (main/master) alors que celle-ci a avance, on le signale
# FORT, avec la commande a lancer. Evite le piege classique : continuer a
# travailler sur une vieille branche figee, loin de l'etat reel du projet.
#
# - Purement informatif, non bloquant : exit 0 systematique (ne crash jamais).
# - Silencieux dans les worktrees lies (une branche de travail dediee y est
#   normale et attendue, l'alerte ne concerne que le checkout principal).
# - Zero appel reseau : utilise le cache git local.

set -euo pipefail

# Pas un repo git -> rien a garder.
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

# Dans un worktree lie : une branche dediee est normale, on ne dit rien.
# (git-dir contient "/worktrees/" quand on est dans un worktree secondaire.)
git_dir=$(git rev-parse --git-dir 2>/dev/null || echo "")
case "$git_dir" in
  *"/worktrees/"*) exit 0 ;;
esac

# Branche courante (vide si HEAD detache).
current=$(git symbolic-ref --short -q HEAD 2>/dev/null || echo "")
if [ -z "$current" ]; then
  echo "[branch-guard] HEAD detache (aucune branche) : git checkout main avant de travailler."
  exit 0
fi

# Trouver la branche principale : main sinon master.
default_branch=""
for b in main master; do
  if git show-ref --verify --quiet "refs/heads/$b"; then
    default_branch="$b"
    break
  fi
done
[ -n "$default_branch" ] || exit 0

# Deja sur la branche principale : rien a signaler ici.
[ "$current" = "$default_branch" ] && exit 0

# Combien de commits la branche principale a-t-elle que la courante n'a pas ?
behind=$(git rev-list --count "${current}..${default_branch}" 2>/dev/null || echo 0)

if [ "${behind:-0}" -gt 0 ]; then
  echo "======================================================================"
  echo "[branch-guard] Tu es sur '$current', $behind commit(s) DERRIERE $default_branch."
  echo "  Risque : travailler sur une branche figee, loin de l'etat reel du projet."
  echo "  A faire : git checkout $default_branch && git pull   (repartir d'une base a jour)"
  echo "======================================================================"
fi

exit 0
