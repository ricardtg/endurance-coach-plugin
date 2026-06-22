# Onboarding, Migration & File Templates

## Onboarding Flow (new athletes)

### Step 1: Folder Setup
- Create `plans/`, `gym/`, `archive/` subfolders
- Never overwrite existing files

### Step 2: Garmin Connection
- Check MCP, confirm or guide setup

### Step 3: Athlete Profile
Gather via AskUserQuestion:

**Running**: age, height, weight, race results, max HR, resting HR, LT HR/pace, weekly volume, training days, running history years.

**Strength**: training history (none/beginner/intermediate/advanced), 1RMs (squat, deadlift, bench, OHP), current routine, injuries/restrictions.

**Body comp**: current weight, goal (maintain/gain/lose/recomp), targets if gaining.

**Equipment**: gym type, available gear → `equipment.md`. Preferred/avoided exercises.

**Schedule**: max sessions/week, max doubles, required rest days, fixed constraints.

Pull from Garmin if connected: `get_user_profile`, `get_race_predictions`, `get_lactate_threshold`, `get_training_status`, `get_body_composition`.

### Step 4: Goals
Races, strength/body comp goals, current emphasis.

### Step 5: Confirm and create files.

## Migration Flow (v0.1.x → v0.2.0)

1. Scan existing folder
2. Create `plans/`, `gym/`, `archive/` if missing
3. Offer to move `*-plan-*.md` and `*-tracker.md` into `plans/`
4. Append strength/body comp sections to `athlete-profile.md` (don't overwrite)
5. Append periodization table to `goals.md` if missing
6. Create `equipment.md` and `strength-log.md` if missing
7. Report all changes

**Never delete or overwrite existing data.**

## File Templates

### athlete-profile.md
```markdown
# Athlete Profile

## Personal
- Name:
- Age:
- Height:
- Weight:

## Running
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
- Training days available:
- Running history (years):

## Strength
### Training Background
- History:
- Training age:
- Current routine:

### Estimated 1RMs
| Lift | Est 1RM | Source | Date |
|------|---------|--------|------|

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

### equipment.md
```markdown
# Gym Equipment & Preferences

## Training Location
- Where:
- Type:

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
| Exercise | Weight | Sets × Reps | Est 1RM | Trend | Updated |
|----------|--------|------------|---------|-------|---------|

## Progression History

## Coaching Notes
```

### goals.md additions (v0.2.0)
```markdown
## Body Composition Goals
- Current weight:
- Target:
- Timeline:

## Annual Periodization
| Phase | Dates | Running | Strength | Notes |
|-------|-------|---------|----------|-------|
```

## Gym Log Template

See `gym-log-format.md` for the full gym log template.
