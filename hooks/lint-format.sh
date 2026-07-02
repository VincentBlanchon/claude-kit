#!/usr/bin/env bash
# Hook PostToolUse pour Write/Edit
# OPTIMISE pour vitesse : exit fast si non-code, ne tente PAS npx (qui telecharge).
# Si biome/prettier pas dispo en local, skip silencieux.
#
# Cible : < 200ms par edit (vs 1-3s avant)

# Lecture stdin une seule fois
input=$(cat)

# Extraction path via jq (rapide, ~20ms)
file_path=$(printf '%s' "$input" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

# Exit fast : pas de fichier
[ -z "$file_path" ] && exit 0

# Exit fast : extension non-code (avant tout autre check)
case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.json|*.jsonc) ;;
  *) exit 0 ;;
esac

# Exit fast : fichier disparu (Write avorte)
[ ! -f "$file_path" ] && exit 0

# Trouve le project root (premier package.json en remontant)
# Limite a 6 niveaux pour eviter de remonter trop loin
dir=$(dirname "$file_path")
for _ in 1 2 3 4 5 6; do
  [ -f "$dir/package.json" ] && break
  parent=$(dirname "$dir")
  [ "$parent" = "$dir" ] && break
  dir=$parent
done

# Tente biome local d'abord (le plus rapide)
if [ -x "$dir/node_modules/.bin/biome" ]; then
  "$dir/node_modules/.bin/biome" format --write "$file_path" >/dev/null 2>&1
  exit 0  # exit 0 meme si biome echoue (non-blocking)
fi

# Fallback prettier local
if [ -x "$dir/node_modules/.bin/prettier" ]; then
  "$dir/node_modules/.bin/prettier" --write "$file_path" >/dev/null 2>&1
  exit 0
fi

# Aucun formatter local : skip silencieux (pas de npx qui telecharge)
exit 0
