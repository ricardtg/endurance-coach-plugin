---
name: plan-builder
description: >
  This skill should be used when the user asks to "create a training plan", "build me a plan", "evaluate this plan",
  "is this plan right for me", "running maintenance plan", "what should my training look like for X race", or shares
  a plan URL/PDF for feedback. Trigger on plan creation, evaluation, periodization, block structure, or distance-specific
  training design. Also trigger on "create my 10K block", "design a training cycle", "review this plan against my profile".
---

# Plan Builder

Build custom running plans, evaluate external plans, or create running maintenance plans for hypertrophy phases. All grounded in athlete data (Garmin + coaching files) and sport science methodology.

## Step 0: Load Context (BLOCKING)

Read from `<coach_dir>`: athlete-profile.md, goals.md, training-log.md, plans-shared.md, equipment.md. Pull Garmin: `get_race_predictions`, `get_training_status`, `get_lactate_threshold`. Do not proceed without these.

## Step 1: Athlete Context

Extract: target race + date, current phase, LT HR/pace, VO2max trend, max HR, RHR, recent races, current volume, injury status, training days, strength plan, body comp goals, Garmin flags.

## Step 2: Training Paces (Daniels VDOT)

Determine working VDOT from most recent well-raced result. Cross-validate with Garmin. Never use Garmin VO2max as VDOT directly.

| Zone | Label | HR Range |
|------|-------|----------|
| Recovery | — | <65% max HR |
| Easy (E) | Aerobic | 65-78% max HR |
| Threshold (T) | Tempo | ~LT HR ±3 bpm |
| Interval (I) | VO2max | 92-97% max HR |
| Repetition (R) | Speed | N/A (too short) |
| Race Pace (RP) | Specific | Distance-dependent |

Present paces as ranges (±5 sec/km). Cross-validate against known HR data. Derive HR zones from observed data, not age formulas.

## Step 3A: Evaluate External Plans

Check each criterion — see `references/evaluation-criteria.md` for detail. In brief: volume compatibility, pace/HR alignment, workout appropriateness for distance, recovery/taper, timing, strength integration, missing elements. End with verdict: use as-is, use with modifications, or reject.

**Always include a strength overlay recommendation** — sessions/week, type, sequencing rules. Reference strength-endurance skill.

## Step 3B: Create a Race Plan

See `references/block-structures.md` for distance-specific programming (5K, 10K, HM, marathon). See `references/plan-format.md` for the output template.

Key principles: Daniels VDOT paces, Pfitzinger recovery protocols, Canova fartlek-first return, Mujika taper (maintain intensity, reduce volume 40-60%).

**Strength overlay in every plan**: placeholder rows ("Strength: Lower A"), sequencing rules section, taper guidance (last heavy lower 7-10 days pre-race, upper continues), cross-reference to strength-endurance skill.

Recovery ramp-up: 5K 3-5 days, 10K 5-7 days, HM 10-14 days, marathon 14-21 days.

After creating: log in plans-shared.md, update goals.md, tell athlete, state validation checkpoint.

## Step 3C: Running Maintenance Plan

For hypertrophy phases. 2-3 runs/week, 1 quality (15-20 min tempo), rest easy, no long runs >70-75 min. Volume 40-60% of race-prep. Running supports strength, not the reverse. Aerobic base decays slowly — the athlete rebuilds quickly when running becomes priority again.

## Principles

1. Data over dogma — trust HR over tables
2. Volume is a lagging constraint — respect where athlete IS
3. Two quality sessions/week is enough
4. Easy must be easy — enforce HR cap
5. Strength is part of the plan — specify timing, interference management, taper
6. Taper is not optional — 2-6% performance improvement (Mujika)
7. Every plan needs bail-out rules
8. Race pacing uses actual distance (GPS reads 1-2% longer)
9. Reduced running during hypertrophy is deliberate, not fitness loss
