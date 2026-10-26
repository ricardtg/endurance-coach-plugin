---
name: running-plan-builder
description: >
  This skill should be used when the user asks to "create a running plan", "build me a plan", "evaluate this plan",
  "is this plan right for me", "running maintenance plan", "what should my training look like for X race", or shares
  a running plan URL/PDF for feedback. Trigger on running plan creation, evaluation, periodization, block structure,
  or distance-specific training design. Also trigger on "create my 10K block", "design a training cycle", "review
  this plan against my profile". This is the modality skill for running plans.
---

# Running Plan Builder

Build custom running plans, evaluate external plans, or create running maintenance plans for hypertrophy phases. All grounded in athlete data (Garmin + coaching files) and sport science methodology.

This skill implements the **running modality** of the plugin's plan-builder contract. Equivalent modality skills can be added for cycling, swimming, or other sports (see `CONTRIBUTING.md`).

## Step 0: Load Context (BLOCKING)

Read from `<coach_dir>`: `athlete-profile.md` (Running modality section), `goals.md`, `current-block.md`, `training-log.md`, `plans-shared.md`, `equipment.md`. Pull Garmin: `get_race_predictions`, `get_training_status`, `get_lactate_threshold`. Do not proceed without these.

If `goals.md` does not have `running` marked as `active`, ask the athlete whether they want to activate it before proceeding.

## Step 1: Athlete Context

Extract: target race + date, current phase, LT HR/pace, VO2max trend, max HR, RHR, recent races, current volume, injury status, training days, parallel strength plan, body comp goals, Garmin flags.

## Step 2: Training Paces (Daniels VDOT)

Determine working VDOT from most recent well-raced result. Cross-validate with Garmin. Never use Garmin VO2max as VDOT directly.

| Zone | Label | HR Range |
|------|-------|----------|
| Recovery | low aerobic | <65% max HR |
| Easy (E) | Aerobic | 65-78% max HR |
| Threshold (T) | Tempo | ~LT HR ±3 bpm |
| Interval (I) | VO2max | 92-97% max HR |
| Repetition (R) | Speed | N/A (too short) |
| Race Pace (RP) | Specific | Distance-dependent |

Present paces as ranges (±5 sec/km). Cross-validate against known HR data. Derive HR zones from observed data, not age formulas.

## Step 3A: Evaluate External Plans

Check each criterion. See `references/evaluation-criteria.md` for detail. In brief: volume compatibility, pace/HR alignment, workout appropriateness for distance, recovery/taper, timing, strength integration, missing elements. End with verdict: use as-is, use with modifications, or reject.

**Always include a strength overlay recommendation**: sessions/week, type, sequencing rules. Reference `strength-endurance` skill.

## Step 3B: Create a Race Plan

See `references/block-structures.md` for distance-specific programming (5K, 10K, HM, marathon). See `references/plan-format.md` for the output template.

Key principles: Daniels VDOT paces, Pfitzinger recovery protocols, Canova fartlek-first return, Mujika taper (maintain intensity, reduce volume 40-60%).

**Strength overlay in every plan**: placeholder rows ("Strength: Lower A"), sequencing rules section, taper guidance (last heavy lower 7-10 days pre-race, upper continues), cross-reference to `strength-endurance` skill.

Recovery ramp-up: 5K 3-5 days, 10K 5-7 days, HM 10-14 days, marathon 14-21 days.

After creating: log in `plans-shared.md`, update `goals.md`, **add or update the running entry in `current-block.md`** (path, week 1/N, role primary/secondary/maintenance, next quality session, next checkpoint), tell athlete, state validation checkpoint.

## Step 3C: Running Maintenance Plan

For hypertrophy phases, off-season, or any block where no race goal is active. The plugin's always-active-plan rule means a maintenance plan is the default whenever no race is queued.

Default prescription: 2-3 runs/week, 1 quality (15-20 min tempo), rest easy, no long runs over 70-75 min. Volume 40-60% of race-prep. Running supports the primary modality, not the reverse. Aerobic base decays slowly (Mujika and Padilla 2000: VO2max drops ~6% in 3-4 weeks of full detraining, much less with maintenance). The athlete rebuilds quickly when running becomes priority again.

After creating: same updates as race plan, with `role: maintenance` in `current-block.md`.

## Principles

1. Data over dogma. Trust HR over tables.
2. **Volume: respect the starting point, do not retreat from the peak**. Build the ramp from the athlete's current volume (week 1 should not exceed it by more than ~20-30%), but the peak the goal demands is the peak the plan prescribes. Do not pre-emptively lower the peak anticipating the athlete will resist; the athlete trusts the plan and executes it. If reality (injury, life, accumulated fatigue) forces a cut, do it explicitly and justified when it happens, never preventively at design time.
3. Two quality sessions per week is enough.
4. Easy must be easy. Enforce HR cap.
5. Strength is part of the plan. Specify timing, interference management, taper.
6. Taper is not optional. 2-6% performance improvement (Mujika and Padilla 2003).
7. Every plan needs bail-out rules. Bail-outs trigger on observed data (missed quality, RHR drift, pain), not on conservative anticipation.
8. **Race pacing uses actual distance** (GPS reads 1-2% longer). Two paces exist for the same race: the *training* race pace (nominal, fine for long runs and race-pace blocks) and the *race-day operational* pace that goes on the watch = goal time ÷ expected GPS distance (e.g. HM 21.2 km: 1:20:00 → 3:46/km, not 3:47). Verify the arithmetic before writing any race-day target.
9. Reduced running during hypertrophy is deliberate, not fitness loss.
10. Always-active-plan: when there is no race goal, output a maintenance plan, never nothing.
11. **Progress the longest continuous block, not only total minutes**. 4×6' and 25' continuous are not equivalent: step the continuous block up (e.g. 2×13' before 25', 2×15' before 30'). A race-pace block inside a long run counts as a continuous block on the same ramp. Check that intervals or races between tempos do not hide a jump in continuous duration.
12. **No quality session the day before the long run**. Q1 goes midweek; the day before the long is easy or rest; a long run with race-pace blocks is itself the Q2.
13. **Test sessions measure only what has been trained**. A calibration cannot use a duration or pace the athlete has never done (it would measure lack of exposure, not fitness), and a decision gate must be run at the pace of the target it validates.
14. **Recoveries: walk or jog depending on purpose**. Walked recoveries suit I/R reps (rep quality is the goal); jog/float recoveries suit threshold and race-pace reps (aerobic continuity is the goal). Respect the athlete's stated preference in `coach-preferences.md`.
