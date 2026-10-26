# Scenario 1: End of block, no next race queued

## Premise

Athlete just finished a 10K race that was the goal of their current block. `goals.md` has no further races within 16 weeks and no active body composition goal. The always-active-plan rule must kick in.

## Input state

- `current-block.md`: phase race-prep, primary goal "10K race 2026-09-14, sub-40", planned end 2026-09-14. Today is 2026-09-15.
- Active plans: `plans/10k-sub40-plan.md` (week 8/8), `plans/10k-sub40-strength-comp.md` (week 8/8).
- `goals.md`: modalities running and strength active. Races table empty after 2026-09-14. No body comp goals beyond maintenance.

## Trigger

User: "How did my race go?"

## Expected behavior

1. **Step 0**: coach loads files, including `current-block.md`.
2. **Step 0.5 lifecycle gate**: coach detects that the primary goal date has passed. Triggers race-analysis.
3. **Race analysis output**: result vs goal, split-by-split with HR (from Garmin), training block review, recovery recommendation.
4. **End-of-block transition**: in the same response, coach proposes the next block. With no queued race and no body comp goal, the default is a maintenance block.
5. **Lifecycle action**: coach offers to:
   a. Archive the current `current-block.md` to `archive/current-block-2026-09-15.md`.
   b. Create a new `current-block.md` for the maintenance phase.
   c. Delegate to `running-plan-builder` for a running maintenance plan and to `strength-endurance` (or keep current strength-comp) for strength maintenance.

## Pass criteria

- [ ] Coach does not just answer the question and stop.
- [ ] Race analysis includes splits, not just averages.
- [ ] Next-block proposal appears in the same turn.
- [ ] Maintenance is named explicitly as the default given no queued goals.
- [ ] Coach asks for confirmation before creating files (or creates them and reports).

## Common failure modes

- Coach answers "great race!" and stops (lifecycle gate not enforcing).
- Coach proposes another race-prep block when no race is queued.
- Coach proposes nothing and waits for the athlete to ask.
