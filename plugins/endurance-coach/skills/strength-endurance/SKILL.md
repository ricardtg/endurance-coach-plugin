---
name: strength-endurance
description: >
  This skill should be used when the athlete is in a race prep phase and asks about gym programming, when the
  running-plan-builder needs a strength overlay, or when the coach delegates a race-phase strength request. Trigger on
  "strength plan for my 10K prep", "gym programming for race phase", "complementary strength for running",
  "what should I do in the gym during my HM build", "strength for running economy", "injury prevention lifting".
  Do NOT use for hypertrophy/mass-gain: that is strength-hypertrophy.
---

# Strength Endurance: Race Prep Strength

Program strength training that serves running: economy improvement, injury prevention, fatigue resistance, upper body maintenance. NOT hypertrophy.

## Step 0: Load Context (BLOCKING)

Read: `athlete-profile.md` (Strength modality section: injuries, training age, 1RMs), `equipment.md` (gear, avoid list), `strength-log.md` (working weights), `goals.md` (race, phase, session budget), `current-block.md`. Check active running plan for scheduling.

## Evidence Base

- **Beattie et al. 2017**: 40-week study, concurrent strength preserves running economy and improves performance.
- **Blagrove et al. 2018 meta-analysis**: ~4 to 5% running economy improvement, ~50% injury risk reduction with concurrent strength.
- **Rønnestad and Mujika 2014 review**: heavy strength training improves long-term endurance performance.
- **Berryman et al. 2018 meta**: heavy + explosive strength most effective for endurance economy.

Heavy compounds, neuromuscular focus, no failure. 3 to 6 reps at 80 to 90% 1RM, RPE 7 to 8 (RIR 2 to 3). Two sessions per week, 40 to 50 min.

## Session Templates

**Session A: Lower + core**: squat variation 4x4-5 RPE 8, hip hinge 3x5 RPE 7-8, single-leg 3x6 each RPE 8, calf 3x8-10 RPE 8, core stability 2x10-12.

**Session B: Upper + maintenance lower**: push 3x6-8 RPE 8, pull 3x6-8 RPE 8, accessory (lateral raise / face pull) 2x12, light lower (hip thrust / calf) 2x8, core 2x10.

See `references/exercise-library.md` for full exercise options and alternatives. Always check `equipment.md` before prescribing. Never use exercises on the athlete's avoid list.

## Periodization Within Race Block

**Early (weeks 1-4) Build**: full sessions, progressive overload. All sets completed at top of rep range → increase weight.

**Mid (weeks 5-8+) Maintain**: same intensity, drop 1 set from lower compounds. Upper unchanged.

**Late (final 2-3 weeks) Taper**: lower drops to 2x3-4, same weight. Last heavy lower 7 to 10 days pre-race. Upper continues normally.

**Race week**: skip lower or very light. Upper optional.

**Deloads**: align with running deloads. 40 to 50% volume reduction, maintain intensity.

## Scheduling Rules

1. Different days best for strength and quality running.
2. Same-day double: strength first, easy running after.
3. Never heavy lower + quality running within 24 h.
4. Upper + running same day is fine.
5. Day before quality running: rest, easy, or upper only.

## Output Format

See `references/plan-format.md` (shared strength plan format). Write to `<coach_dir>/plans/` as `<race>-strength-comp.md`. Include: current working weights, running plan cross-reference, weekly template (unified view), full session prescriptions, phase progression, progression rules, alternatives.

After creating:
1. Update `strength-log.md`.
2. Log in `plans-shared.md`.
3. **Add or update the strength entry in `current-block.md`**: path, week 1/N, role complementary, split, working weights date.
4. Offer gym log generation for week 1.

## Boundaries

Not hypertrophy (delegate to `strength-hypertrophy`). Not running plan modification. Not nutrition. Not physiotherapy.
