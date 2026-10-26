# Scenario 2: "Done with gym" without a pre-generated log

## Premise

Athlete trained at the gym today but did not generate a log file beforehand. They say "done with gym".

## Input state

- `current-block.md`: phase race-prep, active strength plan referencing Lower A on this date.
- `gym/`: contains files from previous weeks but nothing dated today.
- `strength-log.md`: working weights table populated.
- Garmin: a strength_training activity logged today.

## Trigger

User: "done with gym"

## Expected behavior

1. **Locate log**: coach looks for `gym/YYYY-MM-DD-*.md` matching today. Finds none.
2. **Retro-create log**: coach prompts the athlete with the prescribed session (read from strength plan) and asks which exercises were completed, weights used, any swaps. Writes a retrospective log with "RETRO" in the title to `gym/`.
3. **Process the retro log**: same flow as a normal log.
4. **Pull Garmin** strength activity (duration, HR).
5. **Update `strength-log.md`** with new working weights (if progression criteria met).
6. **Update `current-block.md`** strength entry.
7. **Cross-modal check** for the next 24-48 h.
8. **Feedback** to athlete, one-liner unless flag.

## Pass criteria

- [ ] Coach asks for the missing data rather than failing.
- [ ] A retro log file is created and saved to `gym/`.
- [ ] `strength-log.md` updated correctly.
- [ ] `current-block.md` adherence and week counter updated.
- [ ] No silent failure (e.g., coach saying "ok" and doing nothing).

## Common failure modes

- Coach says "I don't see a log, did you train?" and stops.
- Coach updates `strength-log.md` without verifying the actual session.
- Coach skips Garmin pull.
