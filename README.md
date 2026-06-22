# endurance-coach marketplace

Local marketplace that installs the **endurance-coach** plugin v0.2.1 (Garmin MCP bundled).
Use this instead of the "Upload plugin" button, which rejects bundled local/stdio MCP servers.

## Install (Claude Code CLI)

    claude plugin marketplace add /ABSOLUTE/PATH/TO/endurance-coach-marketplace
    claude plugin install endurance-coach@ricard-coach

…or inside an interactive session:

    /plugin marketplace add ./endurance-coach-marketplace
    /plugin install endurance-coach@ricard-coach

## Install (desktop GUI, via GitHub)

The desktop "Add marketplace" accepts a git repo, not a local folder. Push this whole
folder to a GitHub repo, then in Customize → Plugins → Personal plugins → "+" → Add marketplace,
enter `your-username/endurance-coach-marketplace`, then install endurance-coach from it.

## Update later

Bump `version` in both `plugins/endurance-coach/.claude-plugin/plugin.json` and
`.claude-plugin/marketplace.json`, then `/plugin marketplace update ricard-coach`.
