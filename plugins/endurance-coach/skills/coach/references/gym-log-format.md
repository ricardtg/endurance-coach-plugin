# Gym Log Format & Workflow

The gym log is a per-session markdown file the athlete uses **during** training to check off sets and note deviations. The coach reads it back when the athlete says "done with gym" and updates the strength records.

This file defines the canonical format and the two flows: **generation** (coach creates pre-filled logs) and **processing** ("done with gym").

## File Naming

`gym/YYYY-MM-DD-<split-label>.md`

Examples:
- `gym/2026-05-15-lower-a.md`
- `gym/2026-05-17-upper-b.md`
- `gym/2026-05-20-full-body.md`

If two sessions fall on the same date (rare), suffix with `-2`: `2026-05-15-lower-a-2.md`.

## Canonical Template

```markdown
# <Split Label>: <Day> <Mon DD>

**Plan**: <plans/...-strength-...md>
**Week**: N of Total
**Running context**:
- Today: <e.g., "rest" or "easy 8 km this morning">
- Tomorrow: <e.g., "tempo 6 km" or "rest">
- Yesterday: <e.g., "long run 18 km">

---

## <Exercise Name>
**<Weight> kg x <Reps>** (RPE <target>)
- [ ] Set 1
- [ ] Set 2
- [ ] Set 3
- [ ] Set 4
> _Actual weight if different:_
> _Notes:_

---

## <Next Exercise>
...

---

## Session Notes
- _Energy / sleep:_
- _Pains or restrictions:_
- _Swaps:_
- _Other:_

---

When done: tell coach **"done with gym"** and reference this date.
Start Garmin "Strength" when you begin so HR + duration are recorded.
```

## Required Fields

A valid gym log must include:

1. **Header**: split label, date, plan path, week N/Total.
2. **Running context** for today, tomorrow, yesterday. Coach fills this from `current-block.md` running plan at generation time.
3. **At least one exercise block** with weight, reps, RPE target, and one checkbox per planned set.
4. **Session Notes** section at the bottom (even if empty at generation).
5. **Footer reminder** to start Garmin strength tracking and to say "done with gym" when finished.

Optional but encouraged:
- `_Actual weight if different:_` slot per exercise (so the athlete can record on-the-fly load adjustments).
- `_Notes:_` slot per exercise for technique cues or unilateral imbalances.

## Generation Workflow ("generate gym logs for the week")

Default behavior: **week-batch generation**, not per-session-on-demand.

Steps:
1. Read `current-block.md`. Find the active strength plan and current week N.
2. Read the plan document. Pull all sessions scheduled for week N.
3. Read `strength-log.md` for current working weights of every exercise in this week's sessions.
4. Read `equipment.md` to verify each prescribed exercise is available; substitute via the exercise library if not.
5. Read `current-block.md` running plan: extract dates and intensity for the week, so each gym log can include its `Running context`.
6. For each session of the week:
   a. Compute the scheduled date (from the plan's day-of-week mapping).
   b. Check if `gym/YYYY-MM-DD-<split>.md` already exists. If yes, **skip and report**; do not overwrite.
   c. Otherwise, generate the file using the template above. Pre-fill every exercise with the current working weight from `strength-log.md`.
7. Respond with the list of files created (paths) and the list skipped (existing).

Reject ad-hoc per-session generation if the request is ambiguous about which week. Default to "the upcoming week starting Monday".

## Processing Workflow ("done with gym")

Steps (mandatory order):

1. **Locate the log**.
   - Look for a gym log dated today in `gym/`.
   - If none today, look for the most recent unprocessed log (within last 3 days). Ask the athlete to confirm if ambiguous.
   - If no log exists, the athlete trained without one. Create a retrospective log from memory: ask the athlete which split, which exercises, what was done. Use the template, mark "RETRO" in the title.

2. **Parse the log**.
   - Read every exercise block. Count checkboxes completed.
   - Read `_Actual weight if different:_` if present.
   - Read `_Swaps:_` and `_Notes:_`.

3. **Pull Garmin strength activity** for the same date if available (duration, average HR, max HR).

4. **Compute progression**.
   - For each exercise: did all sets complete at top of rep range with prescribed weight? If yes, working weight goes up next session (use the increments from `strength-hypertrophy/references/evidence-base.md`).
   - If sets failed before top of range: hold or microload.
   - Update 1RM estimate via Epley (if working in sub-10 rep range).
   - Track stalls: if same weight and reps stuck for 3+ sessions, trigger stall protocol (microload, swap variant, or deload).

5. **Update `strength-log.md`**.
   - New working weights table with date.
   - Append a row in `Progression History` with the date, session, key lifts, and any notes.

6. **Update `current-block.md`**.
   - Bump strength `Week N` if this completes the week.
   - Update `Working weights last reviewed`.
   - Update `Adherence` counter.

7. **Cross-modal check**.
   - Look at next 24 to 48 h of `current-block.md` running entries. If a quality run is scheduled and today was heavy lower, flag the conflict.

8. **Feedback to athlete**.
   - One-liner: what went well, what to watch, next step.
   - Detailed only if a flag fired (stall, conflict, swap).

9. **Log to `training-log.md`** if there are observations worth carrying forward (RPE drift, new pain, equipment issue).

10. **Mark the log as done**. Rename the file with a `✅ ` prefix: `gym/✅ 2026-05-15-lower-a.md`. Future, generated-but-not-yet-done logs keep no prefix, so the athlete can tell open from closed at a glance in any file browser or Obsidian.

## Edge Cases

- **Swapped exercise**: the athlete writes the swap in `_Swaps:_`. Coach records the actual exercise used in `strength-log.md`, not the originally prescribed one. If the swap repeats 2+ sessions, suggest updating the plan.
- **Partial session**: if fewer sets completed than prescribed, do not increment working weight. Note in `Progression History`.
- **No log at all**: build retrospective from memory and proceed. Encourage the athlete to use the log next time.
- **Multiple unprocessed logs**: process oldest first, in order. Bump week counter only once per week boundary.
