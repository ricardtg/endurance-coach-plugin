# Scenario 5: Strength-only user

## Premise

User does not run. Wants a hypertrophy block. The coach must support single-modality users without complaining about missing running data.

## Input state

- `goals.md` modalities table: `running: none, strength: active`.
- `athlete-profile.md`: Personal section + Strength modality section populated. Running, Cycling, Swimming sections empty (correctly).
- `current-block.md`: does not yet exist (or exists with only a strength entry).
- Body comp goal: gain 2 kg lean mass over 12 weeks.

## Trigger

User: "build me a hypertrophy block"

## Expected behavior

1. **Step 0**: coach loads context. No Garmin running data needed.
2. **Step 0.5 lifecycle gate**: only `strength` is active, so the rule only applies to strength. No nag about running.
3. **Delegate to `strength-hypertrophy`**: which reads athlete-profile Strength section, equipment, goals body comp target.
4. **Build the plan**: 12-week hypertrophy block, Upper/Lower 4x default (or PPL if session budget supports it), MEV-to-MAV volume progression, deload every 4-5 weeks.
5. **Write plan**: `plans/hyp-block-12wk.md` per the shared strength plan format.
6. **Update `current-block.md`**: strength entry only. Modalities active: strength.
7. **No request for running maintenance**: the always-active-plan rule does not extend to inactive modalities.

## Pass criteria

- [ ] Coach does not prompt for running data.
- [ ] Coach does not propose a running maintenance plan.
- [ ] `current-block.md` has one entry under `Active Plans` (strength), and lifecycle gate is satisfied.
- [ ] Hypertrophy plan references `evidence-base.md` (volume, RIR, frequency, stretch bias, deload).
- [ ] Body comp expectation realistic (0.25-0.5 kg/month, communicated explicitly).

## Common failure modes

- Coach asks for VO2max, LT, or race history despite running being inactive.
- Coach suggests "you should also run" without being asked.
- Lifecycle gate fails because it expects a running plan even when running is inactive.
