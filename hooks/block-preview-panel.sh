#!/usr/bin/env bash
# block-preview-panel.sh, hook PreToolUse (claude-kit)
# Bloque le panneau preview integre de Claude Code (outils mcp__Claude_Preview__*)
# au profit d'un VRAI navigateur.
#
# Pourquoi : une UI se valide dans un vrai navigateur, avec le vrai moteur de rendu,
# les vraies polices et le vrai comportement responsive, pas dans un apercu integre
# qui peut mentir sur le rendu final. Le panneau donne une fausse confiance.
#
# Le matcher (settings.json) ne cible que les outils VISUELS
# (preview_start / screenshot / snapshot / click / fill / eval / resize).
# Les outils de pur debug (console_logs, logs, network, inspect, list, stop)
# ne sont pas matches et restent utilisables.

# stdin = JSON de l'appel (non utilise : le matcher a deja filtre).
cat >/dev/null

cat >&2 <<'MSG'
PANNEAU PREVIEW BLOQUE (hook block-preview-panel).
Une UI se valide dans un VRAI navigateur, jamais dans l'apercu integre.
A faire a la place :
  1. Lancer le dev server (Bash en arriere-plan, ou le launch.json du projet).
  2. Ouvrir dans le navigateur : open "http://localhost:<port>"
  3. Preuve visuelle : screenshot du vrai navigateur (ou MCP navigateur si dispo).
Debug serveur sans UI (logs, erreurs reseau) : passe par Bash, pas par le panneau.
MSG
exit 2
