# Scenario 4: Transition from race-prep to hypertrophy

## Premise

Athlete's HM race-prep block just ended. The annual periodization in `goals.md` schedules an off-season hypertrophy block. Athlete asks the coach what's next.

## Input state

- `current-block.md`: phase race-prep, primary goal HM completed yesterday, planned end yesterday.
- `goals.md` periodization: Off-season hypertrophy 2026-11-30 to 2027-02-15.
- Today: 2026-11-23 (day after race).

## Trigger

User: "what's next?"

## Expected behavior

1. **Race analysis** for yesterday's HM (split-by-split, training review).
2. **Recovery recommendation**: post-HM recovery 10 to 14 days before intensity. Easy running only.
3. **Bridge block (1 week)**: maintenance week between end of race-prep and start of hypertrophy.
4. **Hypertrophy block proposal**: delegate to `strength-hypertrophy`. Block duration ~12 weeks. Body comp target from `goals.md`.
5. **Running maintenance plan**: delegate to `running-plan-builder`. 2-3 runs/week, 1 quality, maintenance volume.
6. **Update files**: archive old `current-block.md`, create new for bridge week, then update once hypertrophy block is built.

## Pass criteria

- [ ] Race analysis comes first (the just-completed race demands attention).
- [ ] Recovery window respected before any intensity is proposed.
- [ ] Both modalities have a plan in `current-block.md` for every phase: bridge, then hypertrophy.
- [ ] Hypertrophy plan references `evidence-base.md` (MEV start, frequency 2x, RIR window, deload schedule).
- [ ] Running role shifts from primary to maintenance in `current-block.md`.

## Common failure modes

- Coach proposes the hypertrophy block immediately without the recovery bridge.
- Coach forgets to update running's role (still treats it as primary).
- Plan lacks evidence-base references.
