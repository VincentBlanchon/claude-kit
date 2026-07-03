#!/usr/bin/env bash
# Stop hook — apprentissage continu LEGER (version allegee du "Continuous
# Learning" d'everything-claude-code, benchmark 2026-07-02).
#
# Idee : en fin de session significative, un appel Haiku ASYNCHRONE relit les
# messages de l utilisateur et propose 0-3 "patterns candidats" (corrections /
# preferences / interdits REUTILISABLES) dans ~/.claude/patterns/_candidats.md.
# Le skill /patterns est le juge au prochain LOAD : l utilisateur promeut ou jette.
# JAMAIS d'ecriture automatique dans les patterns actifs.
#
# Garde-fous cout/securite :
# - asynchrone total : le Stop ne bloque jamais (fork + disown, exit 0 immediat)
# - max 1 analyse par session (marqueur ~/.claude/patterns/.candidats-vus/<session>)
# - skip si < 10 messages user dans la session
# - modele haiku, prompt borne (60 derniers messages, 300 chars max chacun)
# - anti-recursion : CLAUDE_PATTERNS_LEARNING court-circuite le hook dans le sous-appel

input=$(cat)
[ -n "${CLAUDE_PATTERNS_LEARNING:-}" ] && exit 0
command -v jq >/dev/null 2>&1 || exit 0
command -v claude >/dev/null 2>&1 || exit 0
command -v python3 >/dev/null 2>&1 || exit 0

transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty')
session=$(printf '%s' "$input" | jq -r '.session_id // empty')
[ -f "$transcript" ] || exit 0
[ -n "$session" ] || session=$(basename "$transcript" .jsonl)

MARKDIR="$HOME/.claude/patterns/.candidats-vus"
CANDIDATS="${CLAUDE_CANDIDATS_FILE:-$HOME/.claude/patterns/_candidats.md}"
mkdir -p "$MARKDIR" "$(dirname "$CANDIDATS")"
[ -f "$MARKDIR/$session" ] && exit 0

(
  export CLAUDE_PATTERNS_LEARNING=1

  extraction=$(python3 - "$transcript" <<'PY'
import json, sys
msgs = []
for line in open(sys.argv[1], errors="replace"):
    try: d = json.loads(line)
    except Exception: continue
    if d.get("type") != "user" or d.get("isSidechain"): continue
    m = d.get("message")
    if not isinstance(m, dict): continue
    c = m.get("content")
    if isinstance(c, list):
        if any(isinstance(b, dict) and b.get("type") == "tool_result" for b in c): continue
        c = " ".join(b.get("text", "") for b in c if isinstance(b, dict) and b.get("type") == "text")
    if not isinstance(c, str): continue
    t = c.strip()
    if not t or (t.startswith("<") and len(t) < 80): continue
    msgs.append(t[:300])
print(len(msgs))
for m in msgs[-60:]:
    print("USER> " + m.replace("\n", " "))
PY
)
  count=$(printf '%s\n' "$extraction" | head -1)
  case "$count" in (*[!0-9]*|"") exit 0;; esac
  [ "$count" -ge 10 ] || exit 0

  touch "$MARKDIR/$session"
  body=$(printf '%s\n' "$extraction" | tail -n +2)

  consigne='Tu recois les messages tapes par un utilisateur pendant UNE session de travail avec un agent de code. Repere UNIQUEMENT des corrections, preferences ou interdits REUTILISABLES dans d autres projets (facon de travailler, style, process, exigences recurrentes) — PAS le contexte metier du projet, PAS les instructions ponctuelles de la tache. Reponds au format STRICT suivant, 0 a 3 lignes maximum, rien d autre :
- [haute|moyenne|basse] "verbatim court (max 15 mots)" -> pattern candidat en une phrase imperative EN FRANCAIS
Si rien de reutilisable, reponds exactement : RIEN'

  out=$(printf '%s' "$body" | claude -p "$consigne" --model haiku 2>/dev/null)
  lignes=$(printf '%s\n' "$out" | grep -E '^-? ?\[(haute|moyenne|basse)\]' | sed 's/^\[/- [/' | head -3)
  [ -n "$lignes" ] || exit 0

  proj=$(basename "$(dirname "$transcript")" | sed 's/^-Users-[a-z]*-Developer-//; s/^-Users-[a-z]*-//; s/--claude-worktrees.*$//' | cut -c1-50)
  {
    printf '\n## %s — %s (%s)\n' "$(date +%Y-%m-%d)" "$proj" "$(printf '%s' "$session" | cut -c1-8)"
    printf '%s\n' "$lignes"
  } >> "$CANDIDATS"
) >/dev/null 2>&1 &
disown 2>/dev/null || true
exit 0
