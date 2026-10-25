#!/usr/bin/env bash
set -euo pipefail

# NOTE: This is a dev-only script, intended for use by maintainers of this repo.
# It is not a supported installer. Modifications to it, or requests for
# modifications, will not be approved.
#
# Links all skills in the repository into ~/.agents/skills, the skill directory
# of Codex and other Agent Skills-compatible harnesses. Each entry is a symlink
# into this repo, so a `git pull` is all that's needed to keep installed skills
# up to date.
#
# Claude Code is deliberately not a destination. It already loads this clone
# as the `nabil-skills@skills-dir` plugin, so a per-skill symlink in
# ~/.claude/skills would load each skill a second time under a bare name, and
# Claude Code keeps the bare one: `nabil-skills:cte` stops resolving and only
# `cte` works. The script removes any such symlink it finds.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.agents/skills")
CLAUDE_SKILLS="$HOME/.claude/skills"

if [ -d "$CLAUDE_SKILLS" ]; then
  for entry in "$CLAUDE_SKILLS"/*; do
    [ -L "$entry" ] || continue
    case "$(readlink -f "$entry")" in
      "$REPO"/skills/*)
        rm "$entry"
        echo "unlinked $(basename "$entry") ($CLAUDE_SKILLS)"
        ;;
    esac
  done
fi

# Collect the repo's skills once, link into every destination. `deprecated/`
# is retired, and `misc/` is kept around but rarely used and not promoted (see
# each bucket's own README): neither belongs in a daily-driver skill
# directory, so both are skipped here, same as everywhere else non-promoted
# skills are kept out. `in-progress/` IS still linked: it's public on purpose,
# feedback wanted, and this local install is exactly where that feedback loop
# runs.
names=()
srcs=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  names+=("$(basename "$src")")
  srcs+=("$src")
done < <(find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/deprecated/*' -not -path '*/misc/*' -print0)

for DEST in "${DESTS[@]}"; do
  # If $DEST is a symlink that resolves into this repo, we'd end up writing the
  # per-skill symlinks back into the repo's own skills/ tree. Detect and bail
  # out instead of polluting the working copy.
  if [ -L "$DEST" ]; then
    resolved="$(readlink -f "$DEST")"
    case "$resolved" in
      "$REPO"|"$REPO"/*)
        echo "error: $DEST is a symlink into this repo ($resolved)." >&2
        echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
        exit 1
        ;;
    esac
  fi

  mkdir -p "$DEST"

  for i in "${!names[@]}"; do
    name="${names[$i]}"
    src="${srcs[$i]}"
    target="$DEST/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done
