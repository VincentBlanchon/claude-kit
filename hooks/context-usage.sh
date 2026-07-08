#!/usr/bin/env bash
# context-usage.sh — lit le VRAI remplissage de contexte de la session courante.
#
# But : rendre l'agent AUTONOME sur sa jauge de contexte. Au lieu de deviner
# ("on est a ~40%"), il lance `bash $HOME/.claude/hooks/context-usage.sh` et lit
# le chiffre reel, extrait du transcript de session (champ usage, tokens input+cache).
#
# Ne charge PAS le transcript dans le contexte de l'agent : ne renvoie qu'une ligne.
# Fenetre : auto (1M si > 200k tokens, sinon 200k) ; surchargeable par CLAUDE_CTX_WINDOW.

# 1) Trouver le transcript de la session courante.
# Claude Code encode le cwd en nom de dossier projet : chaque caractere non
# alphanumerique devient '-'. On derive donc le dossier depuis $PWD.
proj="$HOME/.claude/projects/$(printf '%s' "$PWD" | sed 's/[^a-zA-Z0-9]/-/g')"
f=""
[ -d "$proj" ] && f=$(ls -t "$proj"/*.jsonl 2>/dev/null | head -1)
# Fallback : le transcript le plus recemment ecrit, tous projets confondus.
[ -z "$f" ] && f=$(ls -t "$HOME"/.claude/projects/*/*.jsonl 2>/dev/null | head -1)
[ -z "$f" ] && { echo "contexte : transcript de session introuvable"; exit 0; }

# 2) Dernier usage assistant = taille du prompt au dernier tour (input + cache).
#    jq -R 'fromjson?' tolere une derniere ligne incomplete (transcript en cours d'ecriture).
ctx=$(jq -R 'fromjson? | select(.type=="assistant") | (.message.usage // empty)
  | ((.input_tokens//0)+(.cache_read_input_tokens//0)+(.cache_creation_input_tokens//0))' \
  "$f" 2>/dev/null | grep -E '^[0-9]+$' | tail -1)

case "$ctx" in
  ''|*[!0-9]*) echo "contexte : usage illisible (transcript $(basename "$f"))"; exit 0;;
esac

# 3) Fenetre + pourcentage.
win="${CLAUDE_CTX_WINDOW:-auto}"
if [ "$win" = "auto" ]; then
  if [ "$ctx" -gt 200000 ]; then win=1000000; else win=200000; fi
fi
pct=$(( ctx * 100 / win ))
echo "contexte reel : ${ctx} tokens, ~${pct}% d'une fenetre $(( win / 1000 ))k$([ "$pct" -ge 40 ] && echo ' — zone rouge')"
