# Changelog

All notable changes to this plugin are documented here. Format roughly follows [Keep a Changelog](https://keepachangelog.com/).

## [0.4.0] - 2026-10-26

Merges the 0.2.1 line (what was installed) with the 0.3.0 line (modalities, lifecycle, evidence base), adds lessons learned from months of real use, and makes the plugin installable by other athletes.

### Added
- **`coach-preferences.md`** in the athlete folder: language, reply length, training preferences, rules from corrections, data caveats. Read first; overrides plugin defaults. When the athlete corrects the coach, the rule is written there instead of app memory, so it travels across Cowork, Claude Code and projects.
- **Guided onboarding**: welcome step that explains the folder and that Obsidian is optional (plain folder, Obsidian vault or synced folder), Garmin step with pause/resume across the required app restart, Garmin-first profile prefill, preferences step, closing step with example messages.
- **`garmin-setup.md`**: install, login, verify, troubleshooting table, re-authentication, maintainer notes.
- **`scripts/setup-garmin.sh`**: installs uv if missing and runs the Garmin login.
- **Friend-facing docs**: root `README.md` with a zero-tech "Start here" path and paste-in prompts for Cowork and Claude Code, `UPGRADING.md`.
- **Data interpretation rules** in `coach`: km splits are averages; validate unfamiliar API fields against known values; RHR/readiness only valid with a recorded night; device changes break HR comparisons.
- **Prescription rules** in `coach`: read the tracker cell before prescribing a day; persist any detail added in chat; quality workouts pushed with pace targets.
- **Plan principles** in `running-plan-builder`: progress the longest continuous block; no quality the day before the long run; tests only measure trained durations/paces; walk vs jog recoveries by rep type; race-day operational pace from GPS distance.
- **`garmin-tools.md`**: pace-target workout DTO, known unit traps (`get_lactate_threshold` speed is s/km ÷ 100), recovery data validity, connection checks (`get_full_name` is a false positive; 401 = expired auth).
- **WhatsApp-style chat replies** and "plans are executed as written" in communication rules.
- **No AI-looking punctuation**: no `·` separators and no em dashes in chat, files, emails or materials (the Catalan ela geminada `l·l` is kept).

### Changed
- File conventions from 0.2.1 restored on top of 0.3.0: tracker cells = hard data, analysis in weekly Notes bullets, Adjustment Log, training-log is synthesis only, brevity in files, equipment kept in sync, completed gym logs renamed with `✅` prefix.
- Garmin MCP pinned to upstream commit `a2ca5fc` instead of tracking `HEAD`.
- Migration flow is version-agnostic and creates `coach-preferences.md` / `current-block.md` when missing.
- Repo layout is a marketplace (`.claude-plugin/marketplace.json` + `plugins/endurance-coach/`).

### Renamed
- `plan-builder` → `running-plan-builder`, `hybrid-strength` → `strength-hypertrophy` (from the 0.3.0 line).

## [0.3.0] - 2026-05-14

### Added
- **Communication patterns** in `coach/SKILL.md`: prose-not-headers (chat replies as paragraphs, not bold section headers), no-emotional-framing (direction over preparation), stay-in-scope (no logistic judgments), no-fabricated-numbers, no-activity-IDs-in-chat. Captures coaching feedback patterns learned through use.
- **`weekly-digest-format.md`** in `coach/references/`: shared structure for any weekly view (in-chat recap, scheduled email, dashboard). Warnings on top, seven-day at-a-glance, day-by-day detail, today highlighted, block context footer.
- **Principle 2 of `running-plan-builder`** rewritten to clarify the convivence between "respect current volume as starting point" and "do not pre-emptively negotiate the peak down". Bail-outs trigger on observed data, not on conservative anticipation.

### Added (modality, lifecycle, evidence)
- **`current-block.md`**: canonical state file for what's active right now. Coach reads it on every interaction. See `skills/coach/references/current-block-format.md`.
- **Always-active-plan rule**: every modality marked `active` in `goals.md` must have an entry in `current-block.md` `Active Plans`. Coach blocks coaching answers until this holds.
- **End-of-block detection**: coach surfaces last-week and post-deadline states automatically, runs race-analysis or block-review, and proposes the next block.
- **Modality system**: `goals.md` declares which sports are practiced (`running`, `strength`, `cycling`, `swimming`). `athlete-profile.md` has per-modality sections. Coach only enforces lifecycle for `active` modalities. Single-modality users supported (strength-only, etc.).
- **`gym-log-format.md`**: dedicated reference with full template, generation workflow (week-batch by default), and processing workflow ("done with gym"). Schema is rigid.
- **`evidence-base.md`** for `strength-hypertrophy`: 15-section literature review covering volume dose-response, rep ranges, proximity to failure (RIR/RPE), MEV/MAV/MRV framework, frequency, progressive overload methods, deload science, stretch-mediated hypertrophy, protein context, sleep, concurrent training interference, splits, 1RM estimation. ~30 citations.
- **`plan-format.md`** for strength plans (shared between `strength-endurance` and `strength-hypertrophy`).
- **`examples/` directory**: sample athlete profile, goals, current block, gym log, morning report.
- **LICENSE** (MIT).
- **CONTRIBUTING.md** with adding-a-new-modality guide.
- **CHANGELOG.md** (this file).
- **.github/ISSUE_TEMPLATE/** with bug and feature request templates.

### Changed
- **Renamed skills**:
  - `plan-builder` to `running-plan-builder` (running is now one modality among several).
  - `hybrid-strength` to `strength-hypertrophy`.
- **`coach/SKILL.md`** restructured: added Step 0.5 lifecycle gate; added modality routing; added single-modality user handling.
- **`onboarding.md`** restructured: per-modality profile gathering; mandatory `current-block.md` creation as final step.
- **`strength-hypertrophy/SKILL.md`** rewritten to reference `evidence-base.md`. Added MEV/MAV/MRV framework, RIR window, stretch-mediated hypertrophy, alternative splits (PPL, Full Body).
- **`strength-endurance/SKILL.md`** updated with explicit citations (Beattie 2017, Blagrove 2018 meta, Rønnestad-Mujika 2014, Berryman 2018 meta).
- **`sessions-and-exercises.md`**: exercises marked with `★` for stretch-bias preference. Frequency rule added.
- **`running-plan-builder/SKILL.md`** updated to write to and read from `current-block.md`; maintenance plan is now the default fallback (always-active-plan rule).
- README rewritten for v0.3.

### Removed
- Fantasma reference in `coach/SKILL.md` to a non-existent `references/gym-log-format.md` (the file now exists with full content; reference resolved).

### Migration (from v0.2.x)
The coach skill detects v0.2 layouts and runs a migration flow:
1. Adds the `Modalities` table to `goals.md` (defaulting to `running: active, strength: active` if both have data).
2. Refactors `athlete-profile.md` into modality sections.
3. Prompts the athlete to create `current-block.md` (or builds one from existing trackers if it can infer state).
4. Never overwrites existing user data.

## [0.2.0] - 2026-03 (retroactive)

### Added
- `strength-endurance` skill (race-prep complementary strength).
- `hybrid-strength` skill (off-season hypertrophy).
- Pre-filled gym log files in `gym/` for Obsidian mobile.
- Cross-modal load monitoring in coach.
- Onboarding flow for new athletes.
- Migration flow from v0.1.x.
- Phase awareness in coach (race-prep / transition / hypertrophy / bridge).

## [0.1.x] - 2026-01 to 2026-02 (retroactive)

### Initial
- `coach` skill (orchestrator, session tracking, reports, Garmin integration).
- `plan-builder` skill (running plans, evaluation).
- Garmin MCP integration via `.mcp.json`.
- Daniels VDOT pace tables and Pfitzinger-style block structures (5K, 10K, HM, marathon).
