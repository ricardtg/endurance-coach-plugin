# Upgrading

## What an update touches

| Lives in | What | Touched by a plugin update? |
|----------|------|-----------------------------|
| The plugin (this repo) | Skills, references, Garmin server config | **Replaced** |
| Your coaching folder | Profile, goals, plans, trackers, logs, `coach-preferences.md` | **Never.** The coach's migration only creates missing files and appends missing sections, and asks first |
| `~/.garminconnect/` | Garmin tokens | Never. Same tokens keep working |
| The app's memory (Cowork project memory) | Whatever Claude saved there | Never. But from v0.4 the coach writes new rules to `coach-preferences.md` instead |

## Before updating

1. Back up the coaching folder (copy or zip it). With iCloud/Obsidian, make sure it has finished syncing.
2. If you have used the coach for a while, ask: *"Before I update: list the coaching rules you have in memory that are not in my folder."* Paste anything important into `coach-preferences.md` → Rules From Corrections.

## Update

- Cowork: Customize → Plugins → endurance-coach → Update.
- Claude Code: `claude plugin marketplace update ricard-coach`, then restart.

## After updating

Open your coach project and say **coach**. The migration runs once: it reports every file it created or appended to, one line each. Check `coach-preferences.md` and correct anything that was inferred wrongly.

## v0.2.x / v0.3.x → v0.4.0

- Skills renamed: `plan-builder` → `running-plan-builder`, `hybrid-strength` → `strength-hypertrophy`. If a scheduled task or note calls a skill by its old name, update it.
- New files in your folder: `coach-preferences.md` and, if you did not have it, `current-block.md`.
- Garmin server pinned to a fixed version. Your tokens keep working; no re-login needed.
