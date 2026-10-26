# Scenario 3: Morning report mid-block

## Premise

Athlete is in week 4 of an 8-week race-prep block. Asks for a morning report.

## Input state

- `current-block.md`: phase race-prep, week 4/8 both modalities, next quality session tomorrow.
- Garmin: today's sleep, RHR, HRV, body battery available.
- `training-log.md`: nothing unusual recent.

## Trigger

User: "morning report"

## Expected behavior

1. **Step 0**: loads context.
2. **Step 0.5**: lifecycle clean (block active, modalities have plans, no end-of-block within 7 days actually week 4 of 8, not yet but week 5 would surface if deload approaching).
3. **Report content**:
   a. Recovery line (sleep h, RHR vs baseline, HRV, body battery).
   b. Today's schedule from `current-block.md` (e.g., easy 10 km running + nothing strength today).
   c. Tomorrow surfaced ("Threshold 4 x 1.5 km").
   d. Cross-modal context ("Last heavy lower was 3 days ago; ok").
   e. Flags if any.
   f. One-liner recommendation.

## Pass criteria

- [ ] Report is short (no corporate filler).
- [ ] Pulls actual Garmin recovery data, not made-up numbers.
- [ ] References `current-block.md` for the session schedule, not generic advice.
- [ ] Mentions tomorrow if a quality session is scheduled.
- [ ] Cross-modal context appears.

## Common failure modes

- Generic "feel-good" report without specific data.
- Confusion about which week the athlete is in.
- Missing tomorrow context.
