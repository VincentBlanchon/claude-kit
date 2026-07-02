#!/usr/bin/env bash
# Hook Stop : garde-fou typecheck TS avant de laisser Claude finir.
#
# OBJECTIF : bloquer Claude UNIQUEMENT s'il a INTRODUIT de nouvelles erreurs de
# type — jamais sur les erreurs preexistantes du projet, jamais sur des faux
# positifs. L'ancienne version lancait un `tsc` brut bloquant : dans un repo
# avec des erreurs preexistantes (ou des alias de chemins type SvelteKit que
# `tsc` seul ne resout pas), elle criait au loup a chaque session.
#
# STRATEGIE :
#   1. Skip si pas un projet Node/TS, ou si les deps ne sont pas installees
#      (node_modules absent => "Cannot find module ..." = faux positifs en masse).
#   2. Lance `tsc --noEmit` (rapide, generique tous projets) et compte les erreurs.
#   3. Compare a une baseline stockee PAR-REPO. Ne bloque que si le nombre
#      AUGMENTE (= regression introduite par Claude). Si le nombre baisse, la
#      baseline descend (cliquet) : on ne peut pas regresser sous son meilleur etat.
#
# A placer dans ~/Developer/claude-preset/hooks/typecheck-on-stop.sh
# Reference par les settings.json projet via :
#   "command": "bash ${HOME}/Developer/claude-preset/hooks/typecheck-on-stop.sh"
#
# Source : docs/consultant-claude-code-mai-2026.md section 3.3

# 1. Skip si pas un projet Node/TS
[ -f package.json ] || exit 0
command -v npx >/dev/null 2>&1 || exit 0

# Deps pas installees => typecheck non fiable (faux "module introuvable"). On skip.
[ -d node_modules ] || exit 0

# 2. Typecheck + comptage des erreurs (lignes "error TS...", une par diagnostic)
output=$(npx --no-install tsc --noEmit 2>&1)
count=$(printf '%s\n' "$output" | grep -c 'error TS')

# 3. Baseline par-repo (dans le git-dir : non versionne, stable, propre a chaque
#    repo et chaque worktree). Fallback /tmp keye sur le chemin hors git.
gitdir=$(git rev-parse --git-dir 2>/dev/null)
if [ -n "$gitdir" ]; then
  baseline_file="$gitdir/claude-typecheck-baseline"
else
  key=$(printf '%s' "$PWD" | cksum | cut -d' ' -f1)
  baseline_file="${TMPDIR:-/tmp}/claude-tc-baseline-$key"
fi

baseline=$(cat "$baseline_file" 2>/dev/null)
case "$baseline" in
  ''|*[!0-9]*) baseline=-1 ;;   # baseline absente ou invalide
esac

# Premier passage : on enregistre l'etat courant sans bloquer.
if [ "$baseline" -lt 0 ]; then
  printf '%s\n' "$count" > "$baseline_file"
  exit 0
fi

# Pas de regression : on met a jour la baseline (cliquet vers le bas) et on passe.
if [ "$count" -le "$baseline" ]; then
  printf '%s\n' "$count" > "$baseline_file"
  exit 0
fi

# Regression : Claude a introduit de nouvelles erreurs de type.
printf '%s\n' "$output" | grep 'error TS' | tail -20
echo ""
echo "[Stop hook] $((count - baseline)) nouvelle(s) erreur(s) TypeScript introduite(s) (baseline=$baseline, actuel=$count). Corrige-les avant de finir. Les erreurs preexistantes sont volontairement ignorees." >&2
exit 2
