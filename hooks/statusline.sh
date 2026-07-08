#!/usr/bin/env bash
# statusline.sh, statusline (claude-kit)
# Affiche : modele · dossier courant · jauge de remplissage du contexte.
# Claude Code envoie le JSON de session sur stdin ; le champ
# context_window.used_percentage donne le VRAI taux d'occupation du contexte
# (null avant le 1er appel API et juste apres /compact).
# Au-dela du seuil, on marque "zone rouge" : c'est le moment de compacter ou
# de repartir sur une session fraiche. Affichage terminal, non bloquant.

# Seuil (en %) a partir duquel on alerte sur un contexte trop rempli.
RED_ZONE=${CLAUDE_CONTEXT_RED_ZONE:-70}

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // "?"' 2>/dev/null)
dir=$(printf '%s' "$input" | jq -r '.workspace.current_dir // ""' 2>/dev/null)
dir="${dir##*/}"
pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
pct="${pct%.*}"   # partie entiere

if [ -z "$pct" ]; then
  ctx="ctx , "
else
  filled=$((pct/10)); [ "$filled" -gt 10 ] && filled=10
  empty=$((10-filled))
  bar="$(printf '%*s' "$filled" '' | tr ' ' '#')$(printf '%*s' "$empty" '' | tr ' ' '.')"
  ctx="ctx [$bar] ${pct}%"
  [ "$pct" -ge "$RED_ZONE" ] 2>/dev/null && ctx="$ctx ! zone rouge"
fi

printf '%s · %s · %s' "$model" "${dir:-~}" "$ctx"
