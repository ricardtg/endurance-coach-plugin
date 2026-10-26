# endurance-coach

A running + strength coach that lives inside Claude. It reads your Garmin watch, keeps your profile, plans and logs in a folder on your computer, and coaches you day to day: morning reports, feedback after each session, weekly recaps, training plans and gym programs.

---

## Start here (no technical background needed)

About 10 minutes. You will click a few buttons, paste one message into Claude, and Claude guides you through the rest.

### What you need

- A Mac or Windows computer with the **Claude desktop app** installed and signed in ([claude.ai/download](https://claude.ai/download)). You need a Claude plan that includes **Cowork**.
- Optional: a **Garmin** watch and your Garmin Connect email and password. No Garmin? It still works: you just tell the coach what you did.

### Step 1: Add the coach to Claude

1. Open the Claude app and go to **Cowork**.
2. Click **Customize**, then **Plugins**, then **Personal plugins**.
3. Click the **+** button, then **Add marketplace**.
4. Paste this and confirm:

   ```
   ricardtg/endurance-coach-plugin
   ```

5. In the list that appears, click **Install** next to **endurance-coach**.

### Step 2: Create your coach project

1. In Cowork, create a **new project** and call it `Coach`.
2. When it asks for a folder, create a **new empty folder** called `Coach` (for example inside Documents) and choose it. This folder is where the coach keeps everything about you.

Do you use Obsidian? You can put the folder inside your Obsidian vault instead. If you don't know what Obsidian is, ignore it: a normal folder works exactly the same.

### Step 3: Paste this message into the project

Copy the whole box and send it as your first message (you can translate it to your language, and the coach will answer in that language):

```
Hi! I just installed the endurance-coach plugin and I have no technical background.
Please be my coach and set everything up with me:
1. Check whether my Garmin is connected. If it isn't, guide me to connect it one small step at a time: tell me exactly what to click, what to copy and where to paste it, and wait for me after each step. I don't know what Terminal is.
2. Then run the coach onboarding with me.
Use simple language, no jargon.
```

That's it. From here Claude asks the questions and does the work.

### What will happen with Garmin (so nothing surprises you)

- Claude will ask you to open an app called **Terminal** (press Cmd+Space, type `Terminal`, press Return) and paste **one line** it gives you.
- Terminal will ask for your Garmin **email**, then your **password**. **The password does not show on screen while you type it. That is normal.** Type it and press Return.
- If your Garmin account sends you a code by email or SMS, type that code too.
- When you see `SUCCESS`, **quit Claude completely** (Cmd+Q) and open it again. Go back to your Coach project and write `coach`. The setup continues where it stopped.
- Your password is typed only in Terminal on your own computer. **Never paste your password into the chat.** Claude doesn't need it and never sees it.
- The connection lasts about 6 months. When it expires, the coach tells you and you repeat the one line.

On Windows, tell Claude "I'm on Windows" and it will give you the right steps.

### After the setup

Just talk to it, in your own words:

- "morning report"
- "done with my run"
- "done with gym"
- "what's my week?"
- "weekly recap"
- "build me a plan for a half marathon in March"
- "I want to gain muscle this winter"

If you don't like how it does something ("shorter answers", "always give me pace targets"), tell it. It writes the rule in a file called `coach-preferences.md` in your folder and remembers it.

---

## Using Claude Code instead of Cowork?

Paste this into Claude Code and it will do the installation for you:

```
Please install the endurance-coach plugin for me: add the GitHub marketplace ricardtg/endurance-coach-plugin and install the plugin endurance-coach@ricard-coach. I have no technical background, so run the commands yourself and only ask me for what you can't do. Then help me connect Garmin: run the repo's scripts/setup-garmin.sh in a terminal where I can type my Garmin password myself (never ask me to paste it in the chat). When it's done, tell me how to restart, and after that I'll say "coach" in a folder for my coaching files to start the onboarding.
```

---

## Manual install (technical)

### Garmin login

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ricardtg/endurance-coach-plugin/main/scripts/setup-garmin.sh)"
```

The script ([scripts/setup-garmin.sh](scripts/setup-garmin.sh)) installs `uv` if missing and runs the login of the pinned Garmin MCP server. Tokens go to `~/.garminconnect`. Restart the Claude app afterwards. Manual steps and troubleshooting: [garmin-setup.md](plugins/endurance-coach/skills/coach/references/garmin-setup.md).

### Plugin

Cowork: Customize → Plugins → Personal plugins → **+** → Add marketplace → `ricardtg/endurance-coach-plugin` → install **endurance-coach**.

Claude Code:

```bash
claude plugin marketplace add ricardtg/endurance-coach-plugin
```

```bash
claude plugin install endurance-coach@ricard-coach
```

Then open a project or directory for the coaching folder and say **coach**.

## Updating

- Cowork: Customize → Plugins → endurance-coach → Update.
- Claude Code: `claude plugin marketplace update ricard-coach`.

Your folder is never overwritten by an update. New versions only add missing files and sections. See [UPGRADING.md](UPGRADING.md).

## What's inside

| Skill | Role |
|-------|------|
| **coach** | Daily coaching, session tracking, reports, gym logs, onboarding |
| **running-plan-builder** | Running plans: create and evaluate |
| **strength-endurance** | Strength work during race prep |
| **strength-hypertrophy** | Muscle-gain / strength-primary blocks |

Details: [plugins/endurance-coach/README.md](plugins/endurance-coach/README.md). Changes: [CHANGELOG.md](CHANGELOG.md).

## Privacy

Your training data stays in your folder and in your Garmin account. The Garmin server runs on your computer, pinned to a reviewed version of [Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp). The coach is not a doctor: it flags, it does not diagnose.

MIT license.
