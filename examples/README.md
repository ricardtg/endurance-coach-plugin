# Examples

Sample outputs the plugin produces. These are anonymized and meant as **reference**, not literal templates. The actual files in your coaching folder will look like these but with your own data.

## What's here

- `sample-athlete-profile.md`: a complete athlete profile after onboarding.
- `sample-goals.md`: races, modalities, periodization roadmap, body comp targets.
- `sample-coach-preferences.md`: how one athlete wants to be coached (language, length, preferences, rules learned from corrections, data caveats). Read first by the coach.
- `sample-current-block.md`: the canonical state file for what is active right now.
- `sample-gym-log.md`: a pre-filled gym log ready for mobile use.
- `sample-morning-report.md`: format of the daily morning report.

Plans (running, strength) are too long to keep as static samples; the `running-plan-builder`, `strength-endurance`, and `strength-hypertrophy` skills generate them on demand. See those skills' `references/plan-format.md` files for the structure.

## How the files connect

```
goals.md            ─── declares modalities active, races, periodization
   │
   ├──> current-block.md   ─── what's active RIGHT NOW (week N of N per modality)
   │       │
   │       ├──> plans/<running plan>.md
   │       └──> plans/<strength plan>.md
   │                │
   │                └──> gym/<YYYY-MM-DD>-<split>.md   ─── session log
   │
athlete-profile.md  ─── stable facts (1RMs, PRs, injuries)
strength-log.md     ─── working weights history
training-log.md     ─── append-only observations
```

The **always-active-plan** rule says: for each modality marked `active` in `goals.md`, `current-block.md` must have a corresponding entry under `Active Plans`. The coach blocks all coaching answers until this holds.
