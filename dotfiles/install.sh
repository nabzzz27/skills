#!/usr/bin/env bash
set -euo pipefail

# Links Nabil's global agent instructions into place:
#   ~/.claude/CLAUDE.md -> <repo>/dotfiles/claude/CLAUDE.md
# The link is a symlink, so editing ~/.claude/CLAUDE.md edits the file in this
# repo, and a `git pull` keeps every machine in sync. Safe to re-run: an
# existing real file is backed up first, and an existing correct link is left
# alone.

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
SRC="$DOTFILES/claude/CLAUDE.md"
DEST="$HOME/.claude/CLAUDE.md"

if [ -L "$DEST" ] && [ "$(readlink "$DEST")" = "$SRC" ]; then
  echo "already linked $DEST -> $SRC"
  exit 0
fi

mkdir -p "$(dirname "$DEST")"

if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
  backup="$DEST.bak.$(date +%Y%m%d%H%M%S)"
  mv "$DEST" "$backup"
  echo "backed up existing $DEST to $backup"
fi

ln -sfn "$SRC" "$DEST"
echo "linked $DEST -> $SRC"
