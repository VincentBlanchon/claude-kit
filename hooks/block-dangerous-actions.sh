#!/usr/bin/env bash
# PreToolUse (Bash) — bloque mecaniquement les commandes destructives.
# Rend DETERMINISTES des regles jusqu'ici advisory : kill-rule (jamais de
# kill par pattern), data-safety (jamais de wipe), git-workflow (jamais de
# force push). Ce filet protege l utilisateur qui ne lit pas chaque commande.
# Warn-only n'existe pas ici : match = exit 2 (l'agent recoit la raison).

input=$(cat)
cmd=$(printf '%s' "$input" | { command -v jq >/dev/null 2>&1 && jq -r '.tool_input.command // empty' || cat; })
[ -z "$cmd" ] && exit 0

block() {
  echo "COMMANDE BLOQUEE (hook block-dangerous-actions) : $1" >&2
  echo "Regle : $2" >&2
  echo "Si c'est VRAIMENT necessaire : demander a l utilisateur de la lancer lui-meme, en expliquant quoi et pourquoi." >&2
  exit 2
}

# Kill par pattern — kill-rule , aucune exception
printf '%s' "$cmd" | grep -qE '(^|[;&|[:space:]])(killall|pkill)([[:space:]]|$)' && \
  block "kill par pattern ($(printf '%s' "$cmd" | grep -oE '(killall|pkill)' | head -1))" "identifier le PID exact (lsof -i :port), confirmer avec l utilisateur, kill cible."

# Wipes catastrophiques
printf '%s' "$cmd" | grep -qE 'rm[[:space:]]+(-[a-zA-Z]*r[a-zA-Z]*f|-[a-zA-Z]*f[a-zA-Z]*r)[[:space:]]+("?\$HOME"?|~|/|/\*|\.|\.\.|\*)([[:space:]]|$|/\*)' && \
  block "rm -rf sur racine/home/dossier courant/wildcard" "supprimer des chemins PRECIS et nommes, jamais un wipe large."

# git destructif
printf '%s' "$cmd" | grep -qE 'git[[:space:]]+push[[:space:]]' && printf '%s' "$cmd" | grep -qE '(--force([[:space:]]|$)|[[:space:]]-f([[:space:]]|$))' && ! printf '%s' "$cmd" | grep -q 'force-with-lease' && \
  block "git push --force" "jamais de force push (au pire --force-with-lease sur une branche de travail, jamais main)."
printf '%s' "$cmd" | grep -qE 'git[[:space:]]+clean[[:space:]]+-[a-zA-Z]*f' && \
  block "git clean -f (efface les fichiers non trackes)" "les fichiers non trackes  sont souvent du vrai travail en attente — lister d'abord (git clean -n), decider fichier par fichier."

# SQL destructif UNIQUEMENT via un vrai client DB (evite les faux positifs sur echo/grep/docs)
if printf '%s' "$cmd" | grep -qE '(^|[;&|[:space:]])(psql|supabase|mysql|mariadb|sqlite3|turso|mongosh)([[:space:]]|$)'; then
  printf '%s' "$cmd" | grep -qiE '(drop[[:space:]]+(table|schema|database)|truncate[[:space:]]+table|delete[[:space:]]+from[[:space:]]+[a-z_"]+[[:space:]]*(;|$))' && \
    block "SQL destructif (DROP/TRUNCATE/DELETE sans WHERE) via client DB" "data-safety : etat des lieux chiffre + sauvegarde + accord explicite  AVANT toute destruction de donnees."
fi

exit 0
