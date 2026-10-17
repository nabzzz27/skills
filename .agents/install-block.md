# The canonical install block

One install story, one wording.
`README.md` and every page under `docs/` must say **this** and nothing else.
Change it here first, then propagate.

## One route: clone into the skills directory

This fork has a single install route: clone the repo to `~/.claude/skills/nabil-skills`.
Claude Code loads a plugin from a skills directory whose name matches the plugin `name` in `.claude-plugin/plugin.json`, and reports it as `nabil-skills@skills-dir`.
There is no marketplace to add and no install command.

The files Claude Code runs are the files in the clone, so an edit to a `SKILL.md` takes effect in the next session with no reinstall.
Git is the sync mechanism between machines: `git push` on one, `git pull` on the other.
Nothing updates on its own, and the `version` in `plugin.json` does not gate anything on this route.

`.claude-plugin/marketplace.json` stays as a fallback for installing the repo through `claude plugin marketplace add`, but no doc presents it as a route.

## Claude Code

<canonical-block name="claude-code">

```bash
git clone https://github.com/nabzzz27/skills.git ~/.claude/skills/nabil-skills
```

Start a fresh session and check it loaded:

```bash
claude plugin list
```

</canonical-block>

## Global instructions

<canonical-block name="global-instructions">

```bash
~/.claude/skills/nabil-skills/dotfiles/install.sh
```

</canonical-block>

## Never install alongside upstream

Upstream ships the same skills as `mattpocock-skills@claude-plugins-official`.
Having both enabled gives every skill twice, so always tell the reader to disable upstream:

<canonical-block name="disable-upstream">

```json
"enabledPlugins": {
  "mattpocock-skills@claude-plugins-official": false
}
```

</canonical-block>
