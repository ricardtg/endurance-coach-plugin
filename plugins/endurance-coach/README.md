# Endurance Coach Plugin v0.2.1

Personal coach for hybrid athletes who combine running with strength training. Integrates Garmin Connect data with persistent athlete context stored in a local folder (Obsidian vault recommended for mobile gym log access).

## What's new in v0.2.1

- **Fixed broken reference**: the coach skill pointed to a non-existent `references/gym-log-format.md`; the gym log template now lives in that file.
- **Persistent-file conventions clarified**: tracker cells hold hard data only with analysis in a per-week Notes block; training-log is cross-session synthesis only (no per-session recaps); equipment.md is kept synced with gym logs; completed plans move to `plans/archive/`.

## What's new in v0.2.0

- **Strength programming**: two new skills for gym work — complementary strength for race prep phases, and hypertrophy/mass-gain blocks for off-season
- **Gym log generation**: pre-filled markdown files with checkboxes for Obsidian mobile
- **Cross-modal load monitoring**: recovery metrics interpreted across both running and strength
- **Onboarding flow**: guided setup for new athletes (profile, equipment, goals)
- **Phase-aware coaching**: the coach routes requests to the right skill based on your current training phase

## Skills

| Skill | Role | When it triggers |
|-------|------|-----------------|
| **coach** | Orchestrator, daily coaching, session tracking, reports | "morning report", "done with my run", "done with gym", "weekly recap", "what's my week" |
| **plan-builder** | Running plan creation and evaluation | "build me a 10K plan", "evaluate this marathon plan", "running maintenance plan" |
| **strength-endurance** | Strength programming for race prep phases | "strength plan for my HM prep", "gym programming during race phase" |
| **hybrid-strength** | Hypertrophy + strength for base/off-season | "build me a hypertrophy block", "I want to gain muscle", "off-season gym plan" |

## Setup

### Prerequisites

1. **Python 3.12+** and **uv** (or uvx) installed
2. **Garmin Connect account** (optional — plugin works without it, but you'll need to report data manually)

### Garmin Authentication (one-time)

```bash
uvx --python 3.12 --from git+https://github.com/Taxuspt/garmin_mcp garmin-mcp-auth
```

Enter your Garmin email, password, and MFA code if prompted. Tokens save to `~/.garminconnect`.

### First Use

1. Install the plugin in Claude
2. Mount your coaching folder (Obsidian vault recommended)
3. Say "coach" — the onboarding flow will guide you through profile setup

## Athlete Folder Structure

The plugin creates and maintains these files in your coaching folder:

```
<your-folder>/
├── athlete-profile.md        → Stats, PRs, physiological markers, strength baselines, injuries
├── goals.md                  → Race calendar, body comp goals, periodization roadmap
├── equipment.md              → Gym equipment, preferred/avoided exercises
├── training-log.md           → Coaching observations (both modalities)
├── strength-log.md           → Lift progression history, 1RM tracking
├── plans-shared.md           → External plans submitted for review
├── plans/                    → Plan documents (running + strength)
│   ├── 10k-plan-sub40.md
│   ├── 10k-strength-comp.md
│   └── ...
├── gym/                      → Per-session gym log files (for Obsidian mobile)
│   ├── 2026-04-07-lower-a.md
│   └── ...
└── archive/                  → Completed plans and trackers
```

### Mobile Gym Logs (Obsidian)

The gym log files are designed for Obsidian mobile with iCloud/Sync:
- One file per session with pre-filled exercises, weights, and sets
- Checkbox per set — tap to complete during training
- Space to note weight changes or exercise swaps
- After your session: tell the coach "done with gym" and it processes the log

## Upgrading from v0.1.x

The coach skill includes a migration flow. On first use with v0.2.0:
1. It will detect your existing files
2. Create new subfolders (`plans/`, `gym/`, `archive/`) if missing
3. Add strength sections to your profile and goals (without overwriting existing data)
4. Create `equipment.md` and `strength-log.md`

No data is deleted during migration.

## Usage

Talk to Claude about your training:

**Running:**
- "Morning report"
- "Done with today's run"
- "Weekly recap"
- "Build me a half marathon plan"
- "Analyze my race"

**Strength:**
- "Done with gym"
- "Build me a hypertrophy block"
- "Generate gym logs for the week"
- "Are my lifts progressing?"
- "What should I do in the gym during my 10K prep?"

**Cross-modal:**
- "What's my week?" (unified view of both plans)
- "I'm feeling run down" (analyzes total load from both modalities)
- "Should I lift today or rest before tomorrow's tempo?"
