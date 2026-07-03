#!/usr/bin/env bash
# SessionStart hook — les rappels qui evitent a l'utilisateur d'avoir a Y PENSER.
# Philosophie : MUET par defaut ; ne parle que quand quelque chose l'attend.
# 4 rappels : candidats de patterns en attente, nouvelle semaine de quota,
# config installee en retard sur le repo preset, rituel trimestriel du.

cat >/dev/null 2>&1 || true

DIR="${CLAUDE_RAPPELS_DIR:-$HOME/.claude/.rappels}"
PATTERNS_DIR="${CLAUDE_PATTERNS_DIR:-$HOME/.claude/patterns}"
mkdir -p "$DIR"

# 1) Candidats de patterns en attente de tri (l'apprentissage continu ecrit,
#    ce rappel evite que ca s'accumule sans jamais etre juge).
CAND="$PATTERNS_DIR/_candidats.md"
if [ -f "$CAND" ]; then
  n=$(grep -c '^- \[' "$CAND" 2>/dev/null || echo 0)
  if [ "${n:-0}" -ge 1 ]; then
    echo "[rappels] $n pattern(s) candidat(s) en attente de ton tri — dis « mes patterns » (2 min, promouvoir ou jeter)."
  fi
fi

# 2) Nouvelle semaine de quota (cap hebdo Max plan) → /usage pour piloter aux faits.
week=$(date +%G-W%V)
seen=$(cat "$DIR/semaine.txt" 2>/dev/null || echo "")
if [ "$week" != "$seen" ]; then
  echo "$week" > "$DIR/semaine.txt"
  echo "[rappels] Nouvelle semaine de quota — /usage te montre la ventilation (skills, agents, MCP) pour placer le budget au bon endroit."
fi

# 3) Config installee en retard sur le repo preset (le marqueur est ecrit par install.sh).
MARK="$DIR/preset-install.txt"
if [ -f "$MARK" ]; then
  repo=$(sed -n '1p' "$MARK"); installed=$(sed -n '2p' "$MARK")
  if [ -d "$repo/.git" ]; then
    head=$(git -C "$repo" rev-parse main 2>/dev/null || echo "")
    if [ -n "$head" ] && [ -n "$installed" ] && [ "$head" != "$installed" ]; then
      echo "[rappels] Le repo $(basename \"$repo\") a avance depuis ta derniere installation — lance : cd \"$repo\" && git pull && ./install.sh"
    fi
  fi
fi

# 4) Rituel trimestriel d'entretien (journal de friction, registre, purge, benchmark).
RIT="$DIR/rituel.txt"
now=$(date +%s)
if [ ! -f "$RIT" ]; then
  echo "$now" > "$RIT"   # seme a la premiere execution : prochain rappel dans ~90 jours
else
  last=$(cat "$RIT" 2>/dev/null || echo "$now")
  case "$last" in (*[!0-9]*|"") last=$now;; esac
  if [ $(( (now - last) / 86400 )) -ge 90 ]; then
    echo "[rappels] Rituel trimestriel DU (30 min) : relire tes patterns et tes frictions recentes, purger le CLAUDE.md (ce qui n'est plus suivi ou automatisable en hook), re-benchmarker les references. Quand c'est fait, dis-le : je remets le compteur."
  fi
fi

exit 0
