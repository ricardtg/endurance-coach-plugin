# Current Block Format

`current-block.md` is the canonical source of truth for what is active right now. Coach reads it on every interaction (Step 0), and the always-active-plan rule depends on it.

## Concept

The plugin treats training as a sequence of **blocks**. A block has a phase, a window of dates, a goal, and one or more **active plans** (one per modality). When a block ends, a new one must start before any non-trivial coaching can resume. If no race or body-comp goal is queued, the default is a maintenance block.

## Template

```markdown
# Current Block

## Block Header
- **Block name**: [short descriptive label]
- **Phase**: [race-prep | transition | hypertrophy | maintenance | recovery | bridge]
- **Started**: YYYY-MM-DD
- **Planned end**: YYYY-MM-DD
- **Primary goal**: [e.g., "10K race 2026-09-14, sub-40" or "+2 kg lean mass"]
- **Secondary goal**: [optional]

## Active Plans

### running
- **Path**: plans/<plan-filename>.md
- **Role**: primary | secondary | maintenance
- **Week**: N of Total
- **Next quality session**: YYYY-MM-DD [session label]
- **Next checkpoint**: YYYY-MM-DD [what is being checked]

### strength
- **Path**: plans/<plan-filename>.md
- **Role**: complementary | primary | maintenance
- **Week**: N of Total
- **Split**: [Lower A + Upper / U/L 4x / etc.]
- **Working weights last reviewed**: YYYY-MM-DD

### [other-modality]
Same fields, when added.

## Modalities Active This Block
List the modalities included in this block. Must be a subset of the modalities marked `active` in goals.md.
- [x] running
- [x] strength
- [ ] cycling
- [ ] swimming
- [ ] other: ___

## Block Status
- **Adherence (last 2 weeks)**: X/Y sessions completed
- **Flags**: [any concerns, deviations, injuries]
- **Last updated**: YYYY-MM-DD

## On Block End
This section is invariant. Coach reads it to know how to transition.

1. Run race-analysis (if race was the goal) or block-review (otherwise) automatically.
2. Propose next block based on goals.md:
   - Race scheduled within recovery window: minimal recovery, then next race-prep block.
   - Body comp goal active: propose strength-hypertrophy block.
   - No race, no body comp goal: default to maintenance block (always-active-plan rule).
3. Archive this file to `archive/current-block-YYYY-MM-DD.md` with adherence summary appended.
4. Create new `current-block.md`.
```

## Lifecycle Rules (referenced by coach SKILL.md)

1. **Always-active-plan**: every modality marked `active` in `goals.md` must have an entry in `Active Plans`. If a modality is active but has no plan (or its plan has expired), the coach must propose one before answering any other question.

2. **Plan expiry**: a plan is expired when either (a) today is past `Planned end`, or (b) `Week N` exceeds `Total`. Either condition triggers the on-block-end flow.

3. **End-of-block detection**: when entering the last week of a plan, the coach surfaces it in the morning report and starts preparing the transition proposal. When the planned end passes, the transition is mandatory.

4. **Race goal completion**: if the primary goal is a race and the race date passes, run race-analysis immediately and propose the next block in the same response.

5. **Maintenance is the default**: when no race and no body-comp goal exists, the coach builds a maintenance plan automatically for each active modality. The user can override.

## Update Triggers

Coach updates `current-block.md`:
- After every session: bump `Week N` if appropriate, update `Adherence`, update `Next quality session` / `Next checkpoint`.
- After race or block end: archive and replace.
- On plan modification: update path or week count.
- Manual edits by user are allowed; coach reads it as-is.

## What Lives Here vs. Other Files

| Lives in | What |
|----------|------|
| `current-block.md` | Active state: which plans, which week, what comes next |
| `goals.md` | Future intent: races, body comp targets, periodization roadmap, modalities active |
| `athlete-profile.md` | Stable facts: physiological markers, 1RMs, injuries, history |
| `training-log.md` | Observations log (append-only) |
| `strength-log.md` | Lift progression history |
| `plans/` | The actual plan documents referenced from `current-block.md` |
| `archive/` | Past `current-block.md` snapshots and completed plans |
