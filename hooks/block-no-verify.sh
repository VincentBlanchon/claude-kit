#!/usr/bin/env bash
# Hook PreToolUse pour Bash : bloque --no-verify
# Recupere la commande via jq (au lieu de $TOOL_INPUT)
# Exit 2 = block (Claude saura pourquoi)
#
# A placer dans ~/Developer/claude-preset/hooks/block-no-verify.sh
# Reference par les settings.json projet via :
#   "command": "bash ${HOME}/Developer/claude-preset/hooks/block-no-verify.sh"
#
# Source : docs/consultant-claude-code-mai-2026.md section 3.3

input=$(cat)
cmd=$(echo "$input" | jq -r '.tool_input.command // empty' 2>/dev/null || echo "")

if [ -z "$cmd" ]; then
  exit 0
fi

if echo "$cmd" | grep -qE -- '--no-verify\b'; then
  echo "BLOCKED: --no-verify is not allowed. If a hook fails, fix the underlying issue instead of bypassing." >&2
  exit 2
fi

exit 0
