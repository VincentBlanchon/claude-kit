#!/usr/bin/env bash
# install.sh — claude-kit
# Installe la config, les skills, les agents et les hooks vers ~/.claude/
#
# Non-destructif par defaut : un fichier deja present n'est JAMAIS ecrase
# (il est signale en SKIP, a toi de decider).
#
# Options :
#   --dry-run   montre ce qui serait fait, ne touche a rien
#   --force     ecrase les fichiers existants (les skills/agents/hooks du kit
#               sont alors remis a la version du repo ; CLAUDE.md et
#               settings.json restent proteges sauf confirmation)

set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.claude"
DRY_RUN=false
FORCE=false

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --force)   FORCE=true ;;
    *) echo "Option inconnue : $arg (options : --dry-run, --force)"; exit 1 ;;
  esac
done

installed=0; skipped=0; forced=0

log()  { printf "  %s\n" "$1"; }
say()  { printf "\n%s\n" "$1"; }

# copy_file <source> <destination>
copy_file() {
  local src="$1" dst="$2"
  if [ -e "$dst" ]; then
    if cmp -s "$src" "$dst" 2>/dev/null; then
      return 0  # identique, rien a faire
    fi
    if [ "$FORCE" = true ]; then
      $DRY_RUN || cp "$src" "$dst"
      log "FORCE   ${dst/#$HOME/~}"
      forced=$((forced+1))
    else
      log "SKIP    ${dst/#$HOME/~} (existe deja, different : --force pour ecraser)"
      skipped=$((skipped+1))
    fi
  else
    $DRY_RUN || { mkdir -p "$(dirname "$dst")"; cp "$src" "$dst"; }
    log "INSTALL ${dst/#$HOME/~}"
    installed=$((installed+1))
  fi
}

# copy_tree <source_dir> <dest_dir> : copie fichier par fichier (respecte SKIP/FORCE)
copy_tree() {
  local src_dir="$1" dst_dir="$2"
  while IFS= read -r -d '' f; do
    local rel="${f#"$src_dir"/}"
    copy_file "$f" "$dst_dir/$rel"
  done < <(find "$src_dir" -type f -print0)
}

say "claude-kit : installation vers ${DEST/#$HOME/~} $($DRY_RUN && echo '(DRY RUN, rien ne sera ecrit)')"
$DRY_RUN || mkdir -p "$DEST" "$DEST/rules" "$DEST/skills" "$DEST/agents" "$DEST/hooks" "$DEST/patterns"

say "1. Config globale"
copy_file "$KIT_DIR/config/CLAUDE.md" "$DEST/CLAUDE.md"
copy_file "$KIT_DIR/config/settings.json" "$DEST/settings.json"

say "2. Rules (toujours chargees)"
copy_tree "$KIT_DIR/config/rules" "$DEST/rules"

say "3. Skills"
copy_tree "$KIT_DIR/skills" "$DEST/skills"

say "4. Agents"
copy_tree "$KIT_DIR/agents" "$DEST/agents"

say "5. Hooks"
copy_tree "$KIT_DIR/hooks" "$DEST/hooks"
$DRY_RUN || chmod +x "$DEST/hooks/"*.sh 2>/dev/null || true

# Marqueur pour le rappel "config en retard sur le repo" (hooks/rappels.sh)
if [ "$DRY_RUN" = false ]; then
  mkdir -p "$DEST/.rappels"
  { echo "$KIT_DIR"; git -C "$KIT_DIR" rev-parse main 2>/dev/null || echo "?"; date +%Y-%m-%d; } > "$DEST/.rappels/preset-install.txt"
fi

say "Resultat : $installed installe(s), $skipped ignore(s), $forced ecrase(s)."

if [ "$skipped" -gt 0 ]; then
  cat <<'EOF'

Des fichiers existants ont ete conserves (SKIP ci-dessus). Deux cas :
  - Tu as deja une config a toi : compare a la main avant d'ecraser
    (ex : diff ~/.claude/CLAUDE.md config/CLAUDE.md).
  - Tu veux la version du kit partout : relance avec --force.

Note : si ~/.claude/settings.json a ete conserve, verifie qu'il contient bien
le bloc "deny" sur les secrets et le cablage des hooks (voir config/settings.json).
EOF
fi

say "Termine. Prochaine etape : lis GUIDE-DEMARRAGE.md puis lance 'claude' dans un projet."
