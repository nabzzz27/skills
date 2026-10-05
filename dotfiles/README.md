# dotfiles

Nabil's personal machine config for agent harnesses. Not skills: nothing here ships in the plugin.

- [`claude/CLAUDE.md`](./claude/CLAUDE.md): global instructions every Claude Code session loads, linked to `~/.claude/CLAUDE.md`.
- [`install.sh`](./install.sh): creates that link. Safe to re-run; an existing real `~/.claude/CLAUDE.md` is backed up first.

## New machine

```bash
git clone https://github.com/nabzzz27/skills ~/.claude/skills/nabil-skills
~/.claude/skills/nabil-skills/dotfiles/install.sh
```

Because `~/.claude/CLAUDE.md` is a symlink into this repo, edits made there are edits to `claude/CLAUDE.md`. Commit and push them, then `git pull` on other machines.
