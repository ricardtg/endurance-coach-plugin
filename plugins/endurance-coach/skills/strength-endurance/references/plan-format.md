# Strength Plan Format (Shared)

This format is shared by both strength skills:
- `strength-endurance` (race-prep complementary).
- `strength-hypertrophy` (hypertrophy or strength-primary blocks).

Plans are written to `<coach_dir>/plans/` as standalone markdown. The coach references them from `current-block.md`.

## Filename Convention

- Race-prep complementary: `<race-id>-strength-comp.md` (e.g., `10k-sub40-strength-comp.md`).
- Hypertrophy block: `hyp-block-<duration>.md` or `hyp-block-<label>.md`.
- Maintenance: `maint-strength-<start-date>.md`.

## Required Sections

### Header
- Athlete name (or initials).
- Block label and purpose.
- Duration (start and end dates).
- Linked running plan (if hybrid) with path.
- Primary goal of this strength block.

### Evidence Anchor
One short paragraph stating which evidence-base sections drive the design (volume target, frequency, RIR window, deload schedule). Cite by section number from `evidence-base.md`. This forces the plan to be defensible.

### Current Working Weights Table
| Exercise | Working weight | Sets x Reps | Est 1RM | Date set |
|----------|----------------|-------------|---------|----------|

Pull from `strength-log.md`. If missing for a prescribed exercise, mark "TBD week 1" so the athlete establishes a working set in the first session.

### Weekly Template (Unified View)
A 7-day table showing all sessions across modalities (strength + any running maintenance or race prep), so the athlete sees the full week. Mark double-session days. Mark forced rest days.

| Day | Modality | Session | Notes |
|-----|----------|---------|-------|
| Mon | strength | Upper A | |
| Tue | running | Easy 8 km | |
| Wed | strength | Lower A | |
| ... | | | |

### Full Session Prescriptions
For each session type, list every exercise with: prescribed weight (or formula for week 1 if working weight unknown), set x rep prescription, RPE/RIR target, rest interval guidance, stretch-bias note where relevant, and at least one alternative per exercise.

### Phase Progression
Week-by-week or phase-by-phase progression table:
- Race-prep complementary: Build (weeks 1-4) → Maintain (5-8) → Taper (final 2-3) → Race week.
- Hypertrophy: MEV start → progressive volume add → MAV plateau → deload → repeat or transition.
- Maintenance: stable volume and load, no progression mandate.

### Progression Rules
- Double progression algorithm (rep range to weight increment).
- Increments per exercise type (barbell, dumbbell, machine).
- 1RM estimation method.
- Stall protocol (microload, swap variant, deload).

### Deload Plan
- Frequency (every 4 to 6 weeks for hypertrophy, aligned with running deload for race prep).
- How deload week looks (volume cut to 40-50%, intensity preserved).
- Auto-regulated triggers (HRV down, sleep poor, joint pain).

### Cross-Modal Sequencing Rules (if hybrid)
- No heavy lower within 24 h of quality running.
- Upper + running same day acceptable.
- Race week: last heavy lower 7 to 10 days pre-race, upper continues.

### Transition Plan (mandatory)
What replaces this block when it ends. Three cases the plan must cover:
1. **Block goal achieved or window closes**: next block path (e.g., "transition to race-prep with strength-endurance" or "transition to maintenance via maint-strength").
2. **Early termination (injury, life)**: minimal maintenance fallback.
3. **No specific next block planned**: default to a 2-week maintenance bridge.

The transition plan is what makes the always-active-plan rule work: every strength plan must specify its successor, so the coach never finds itself at end-of-block with nothing queued.

### Adjustment / Bail-Out Rules
Common scenarios with explicit handling:
- Session feels much heavier than RPE target → drop one set, reassess next session.
- Pain over 4/10 → swap to alternative, flag to physio if persists.
- Schedule disruption (missed day) → which session to drop, never the priority lift.
- Running interference symptoms → de-emphasize lower volume, communicate with running-plan-builder.

## Optional Sections

- Lifts not prescribed but the athlete wants to keep (e.g., a favorite isolation): note as discretionary, do not count toward weekly volume budget.
- Mobility / warm-up routine if the athlete wants one documented.
- Notes on equipment-specific exercise selections.

## After Creating the Plan

The skill that produced this plan must:
1. Update `strength-log.md` with the new working weights table (or schedule first-session weight tests if any are TBD).
2. Log the plan in `plans-shared.md` with a one-line summary.
3. Add or update the strength entry in `current-block.md` with path, week 1/N, role, split, and working weights date.
4. Offer gym log generation for week 1 (see `coach/references/gym-log-format.md`).
