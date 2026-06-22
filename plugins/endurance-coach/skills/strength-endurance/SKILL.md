---
name: strength-endurance
description: >
  This skill should be used when the athlete is in a race prep phase and asks about gym programming, when the
  plan-builder needs a strength overlay, or when the coach delegates a race-phase strength request. Trigger on
  "strength plan for my 10K prep", "gym programming for race phase", "complementary strength for running",
  "what should I do in the gym during my HM build", "strength for running economy", "injury prevention lifting".
  Do NOT use for hypertrophy/mass-gain — that's hybrid-strength.
---

# Strength-Endurance: Race Prep Strength

Program strength training that serves running: economy improvement, injury prevention, fatigue resistance, upper body maintenance. NOT hypertrophy.

## Step 0: Load Context (BLOCKING)

Read: athlete-profile.md (injuries, training age, 1RMs), equipment.md (gear, avoid list), strength-log.md (working weights), goals.md (race, phase, session budget). Check active running plan for scheduling.

## Evidence Base

Beattie 2017, Blagrove 2018 meta-analysis (~4-5% running economy, ~50% injury risk reduction), Rønnestad 2012. Heavy compounds, neuromuscular focus, no failure. 3-6 reps at 80-90% 1RM, RPE 7-8. Two sessions/week, 40-50 min.

## Session Templates

**Session A — Lower + core**: squat variation 4×4-5 RPE 8, hip hinge 3×5 RPE 7-8, single-leg 3×6 each RPE 8, calf 3×8-10 RPE 8, core stability 2×10-12.

**Session B — Upper + maintenance lower**: push 3×6-8 RPE 8, pull 3×6-8 RPE 8, accessory (lateral raise/face pull) 2×12, light lower (hip thrust/calf) 2×8, core 2×10.

See `references/exercise-library.md` for full exercise options and alternatives. Always check equipment.md before prescribing. Never use exercises on the athlete's avoid list.

## Periodization Within Race Block

**Early (weeks 1-4) Build**: full sessions, progressive overload. All sets completed → increase weight.

**Mid (weeks 5-8+) Maintain**: same intensity, drop 1 set from lower compounds. Upper unchanged.

**Late (final 2-3 weeks) Taper**: lower drops to 2×3-4, same weight. Last heavy lower 7-10 days pre-race. Upper continues normally.

**Race week**: skip lower or very light. Upper optional.

**Deloads**: align with running deloads. 40-50% volume reduction, maintain intensity.

## Scheduling Rules

1. Different days best for strength and quality running
2. Same-day double: strength first → easy running after
3. Never heavy lower + quality running within 24h
4. Upper + running same day = fine
5. Day before quality running: rest, easy, or upper only

## Output Format

Write to `<coach_dir>/plans/` as `<race>-strength-comp.md`. Include: current working weights, running plan cross-reference, weekly template (unified view), full session prescriptions, phase progression, progression rules, alternatives. After creating: update strength-log.md, log in plans-shared.md, offer gym log generation.

## Boundaries

Not hypertrophy (→ hybrid-strength). Not running plan modification. Not nutrition. Not physiotherapy.
