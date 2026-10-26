# Onboarding, Migration & File Templates

## Onboarding Flow (new athletes)

Run this when the coaching folder has no `athlete-profile.md`. Speak the athlete's language from the first message. Keep each step short: one question block at a time with AskUserQuestion, sensible defaults, and "skip" always allowed. Tell the athlete up front it takes about 10 minutes and that everything can be edited later.

### Step 0: Welcome and Where the Files Live
Explain in two or three sentences:
- The coach keeps everything in **plain markdown files in one folder** on their computer. That folder is the coach's memory: profile, goals, plans, logs, preferences. It works in Cowork and in Claude Code, and nothing is locked into one app.
- **Obsidian is optional.** Ask which setup they want:
  - **Plain folder** (default, simplest): e.g. `Documents/Coach`. They read files in Finder, any text editor, or not at all; the coach reports in chat.
  - **Obsidian vault**: the same folder opened in Obsidian (free). Best if they want to tick gym sets on the phone during training: gym logs are checklists that sync through iCloud or Obsidian Sync. Point them to put the folder inside their vault (e.g. `Obsidian Vault/Coach`).
  - **Synced plain folder** (iCloud Drive / Dropbox / Google Drive): read-only on the phone without Obsidian.
- Record the choice in `coach-preferences.md` → Setup. Nothing else in the plugin changes with the choice: same files, same names. The only differences: with Obsidian, mention that checkboxes in gym logs can be ticked on the phone; without it, the athlete can simply tell the coach what they did ("done with gym: bench 3×8 at 40").

If the folder is not mounted yet: in Cowork use `request_cowork_directory` and suggest creating a new folder named `Coach`; in Claude Code ask for the path.

### Step 1: Folder Setup
- Create `plans/`, `plans/archive/`, `gym/`, `archive/` subfolders.
- Never overwrite existing files.

### Step 2: Garmin Connection
Optional, but explain what it adds: real splits, HR, sleep and recovery data, and workouts pushed to the watch. Without it, the athlete reports sessions by hand.

1. Test with `get_activities(0, 1)`. If it works, confirm with the name of the latest activity and move on.
2. If Garmin tools are missing or the call fails, walk them through `garmin-setup.md` → "What the athlete needs". **Assume zero technical background** unless they show otherwise: one small step per message, then wait for their reply.
   - How to open Terminal (Mac: Cmd+Space, type `Terminal`, Return; Windows: ask, and use the PowerShell steps in `garmin-setup.md`).
   - Give exactly one line to paste, in its own code block: the "one-line setup" from `garmin-setup.md`. How to paste: Cmd+V, then Return.
   - Warn before they need it: the password **does not appear on screen** while typing; that is normal.
   - The password and MFA code are typed in **their Terminal, never in the chat**. If they paste a password in the chat anyway, tell them to change it in Garmin Connect.
   - Ask them to paste back what Terminal shows at the end (never the password) so you can confirm `SUCCESS` or diagnose with the troubleshooting table.
   - If they are in Claude Code with a terminal tool available, you may start the setup script in a terminal tab yourself, but they still type the credentials there.
3. They must quit and reopen the Claude app after logging in, which ends this conversation. Before that, **save onboarding progress** to `coach-preferences.md` → Setup (`Onboarding: paused at Garmin step`), so the next "coach" resumes at Step 3 instead of starting over.
4. If they prefer to skip Garmin, record `Garmin: not connected` and continue. Offer it again later only if they ask or a session analysis would clearly need it.

### Step 3: Modalities Declaration
Ask which modalities the athlete trains. This determines which sections of `athlete-profile.md` to populate.

Supported modalities: `running`, `strength`. Future-friendly slots in templates: `cycling`, `swimming`.

Mark each modality `active`, `dormant` (paused but will return), or `none` (not practiced).

### Step 4: Athlete Profile (per modality)
Gather via AskUserQuestion, only for `active` modalities. **If Garmin is connected, pull first and ask the athlete to confirm** instead of asking from scratch: `get_user_profile`, `get_race_predictions`, `get_lactate_threshold` (mind the unit trap in `garmin-tools.md`), `get_training_status`, `get_heart_rate_zones`, `get_body_composition`, `get_personal_record`.

**All athletes**: age, height, weight, sex, training history (years), watch/HR sensor used (and the date of any recent device change).

**If running active**: race results, max HR, resting HR, LT HR/pace, weekly volume, training days, running history years.

**If strength active**: training history (none/beginner/intermediate/advanced), 1RMs (squat, deadlift, bench, OHP), current routine, injuries/restrictions.

**If cycling active**: FTP, max HR (cycling), volume.

**If swimming active**: CSS, threshold pace, volume.

**Body comp** (all athletes): current weight, goal (maintain/gain/lose/recomp), targets if gaining.

**Equipment** (if strength active): gym type, available gear (write to `equipment.md`), preferred/avoided exercises.

**Schedule**: max sessions/week, max doubles, required rest days, fixed constraints, preferred order on double days (gym first or run first).

### Step 5: Goals
Races (with dates), body composition goals, current emphasis, annual periodization roadmap (optional but recommended).

### Step 6: Coaching Preferences
Create `coach-preferences.md` from the template below. Ask only these, with defaults pre-selected:
- Language for the coach (default: the language they are writing in).
- Reply length: short WhatsApp-style (default) or detailed.
- Recoveries between interval reps: walk, jog, or no preference.
- Watch workouts: pace target (default) or HR target.
- Anything the coach must always or never do (free text, optional).

Explain in one sentence: when they correct the coach, the rule is saved in this file, and they can edit it themselves any time.

### Step 7: Current Block
**Mandatory** before finishing onboarding. The coach builds an initial `current-block.md`:
- If the athlete has a race scheduled within 16 weeks, propose a race-prep block and delegate to `running-plan-builder` (and `strength-endurance` if strength is active).
- If body comp goal is active and no race within range, propose a hypertrophy block (delegate to `strength-hypertrophy`).
- Otherwise default to a maintenance block (coach generates a minimal plan for each active modality).

Onboarding does not complete until `current-block.md` exists with at least one entry in `Active Plans`.

### Step 8: Confirm and Show How to Use It
Summarize what was created (file list, one line each). Mention the always-active-plan rule. Then give five example messages they can send tomorrow: "morning report", "done with my run", "done with gym", "what's my week?", "weekly recap". Mark onboarding complete in `coach-preferences.md` → Setup.

## Migration Flow (any older version → current)

Run when core files exist but newer ones are missing. **Never delete or overwrite existing data**; only create missing files and append missing sections.

1. Scan existing folder.
2. Create `plans/`, `plans/archive/`, `gym/`, `archive/` if missing.
3. Offer to move `*-plan-*.md` and `*-tracker.md` into `plans/`.
4. Append modality sections to `athlete-profile.md` if missing. Move existing strength data into the Strength modality section only with the athlete's OK.
5. Append `Modalities` table to `goals.md` if missing. Default to `running: active, strength: active` if both have data; otherwise infer.
6. Append periodization table to `goals.md` if missing.
7. Create `equipment.md` and `strength-log.md` if missing and strength is active.
8. **Create `current-block.md`** if missing. If the athlete has an active plan in `plans-shared.md` or `plans/`, populate it. If no active plan can be inferred, prompt the athlete to set one before continuing.
9. **Create `coach-preferences.md`** if missing. Fill what can be inferred from the existing files (language of the files, setup type, Garmin status) and ask Step 6 for the rest. If the athlete has coaching rules stored elsewhere (app memory, notes), offer to import them here.
10. Report all changes, one line per file.

## File Templates

### athlete-profile.md

```markdown
# Athlete Profile

## Personal
- Name:
- Age:
- Height:
- Weight:
- Sex:
- Training history (years):

## Modality: Running
> Skip section if running is not in your active modalities.

### Physiological Markers
- VO2max (Garmin estimate):
- Max HR (observed):
- Resting HR:
- Lactate Threshold HR:
- Lactate Threshold Pace:

### Race Results
| Date | Race | Distance | Time | Notes |
|------|------|----------|------|-------|

### Training Status
- Current weekly volume (km):
- Long run capacity:
- Training days available:
- Running history (years):

## Modality: Strength
> Skip section if strength is not in your active modalities.

### Training Background
- History (years):
- Training age:
- Current routine (before this plugin):

### Estimated 1RMs
| Lift | Est 1RM | Source | Date |
|------|---------|--------|------|

### Anthropometry / Mobility
- Limb proportions (notes for exercise selection):
- Mobility flags:

## Modality: Cycling
> Skip section if cycling is not in your active modalities.

### Physiological Markers
- FTP:
- Max HR (cycling):
- Resting HR (cycling-specific if measured):

### Training Status
- Current weekly volume (h or km):
- Long ride capacity:

## Modality: Swimming
> Skip section if swimming is not in your active modalities.

### Physiological Markers
- CSS (Critical Swim Speed):
- 100m pace at threshold:

### Training Status
- Current weekly volume (m):

## Body Composition
- Current weight:
- Goal:
- Target (if gaining):
- Racing weight target:

## Injuries & Restrictions
| Date | Injury/Condition | Status | Impact on Training |
|------|-----------------|--------|-------------------|

## Schedule Constraints
- Max sessions/week:
- Max double sessions/week:
- Required rest days:
- Fixed constraints:
```

### goals.md

```markdown
# Goals

## Modalities
| Modality | Status | Notes |
|----------|--------|-------|
| running | active | |
| strength | active | |
| cycling | none | |
| swimming | none | |

> Coach only enforces always-active-plan rule for modalities marked `active`.

## Races
| Date | Race | Distance | Goal | Current Plan |
|------|------|----------|------|--------------|

## Body Composition Goals
- Current weight:
- Target:
- Timeline:
- Racing weight target:

## Annual Periodization
| Phase | Dates | Modalities Emphasis | Notes |
|-------|-------|---------------------|-------|

## Strength Goals
| Lift | Target | Deadline |
|------|--------|----------|

## Notes
```

### coach-preferences.md

How this athlete wants to be coached. The coach reads it first and its rules override the plugin defaults. The athlete can edit it freely.

```markdown
# Coach Preferences

## Setup
- Folder type: plain folder | Obsidian vault | synced folder
- Garmin: connected | not connected
- Onboarding: complete | paused at <step>

## Communication
- Language:
- Reply length: short (WhatsApp-style) | detailed
- Tone notes:

## Training Preferences
- Recoveries between I/R reps: walk | jog | no preference
- Watch workouts: pace target | HR target
- Double days: gym first, run later | run first | no preference
- Other:

## Rules From Corrections
<!-- One line per rule: YYYY-MM-DD: rule. Why (one line). -->

## Data Caveats
<!-- Things that change how data must be read: watch changes (date + offset), known sensor issues, altitude stays, illness periods. -->
```

### current-block.md
See `current-block-format.md` for the canonical template and lifecycle rules.

### equipment.md

```markdown
# Gym Equipment & Preferences

## Training Location
- Where:
- Type (commercial / home / hybrid):

## Available Equipment

### Free Weights
- [ ] Barbell + rack
- [ ] Dumbbells (range: __ to __ kg)
- [ ] Trap bar
- [ ] EZ curl bar

### Machines
- [ ] Leg press
- [ ] Cable machine
- [ ] Lat pulldown
- [ ] Leg curl/extension
- [ ] Smith machine
- [ ] Calf raise machine

### Other
- [ ] Pull-up bar
- [ ] Resistance bands
- [ ] Kettlebells

## Preferred Exercises

## Exercises to Avoid

## Notes
```

### strength-log.md

```markdown
# Strength Training Log

## Current Phase

## Working Weights
| Exercise | Weight | Sets x Reps | Est 1RM | Trend | Updated |
|----------|--------|-------------|---------|-------|---------|

## Progression History

## Coaching Notes
```

### Gym Log Template
See `gym-log-format.md` for the canonical session-log template and the rules around generation and processing.
