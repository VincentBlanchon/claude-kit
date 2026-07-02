#!/usr/bin/env bash
# PostToolUse (Write|Edit) — detecteur de derive "AI slop" sur le front.
# WARN-ONLY (exit 0) : signale les tells de slop de la regle frontend-aesthetics
# des qu'ils apparaissent dans un fichier front edite. designsense ne protege
# que quand il est charge ; ce hook attrape la derive A CHAQUE edition.

input=$(cat)
file=$(printf '%s' "$input" | { command -v jq >/dev/null 2>&1 && jq -r '.tool_input.file_path // empty' || echo ""; })
case "$file" in
  *.tsx|*.jsx|*.css) ;;
  *) exit 0 ;;
esac
[ -f "$file" ] || exit 0

tells=""
grep -qE '"Inter"|'"'"'Inter'"'"'' "$file" && tells="$tells Inter-par-defaut"
grep -qE 'from-(purple|violet|indigo)-[0-9]|to-(purple|violet|indigo)-[0-9]' "$file" && tells="$tells degrade-violet"
grep -qE 'backdrop-blur' "$file" && tells="$tells glassmorphism"

if [ -n "$tells" ]; then
  echo "[warn-frontend-slop] Tells de slop detectes dans $(basename "$file") :$tells" >&2
  echo "Rappel regle frontend-aesthetics : pas d'Inter par defaut, pas de degrade violet/indigo, pas de glass systematique. Si c'est un choix DELIBERE de la DA du projet (DESIGN.md), ignore ce warning ; sinon corrige avant de livrer." >&2
fi
exit 0
