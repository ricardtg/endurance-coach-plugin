---
name: strength-hypertrophy
description: >
  This skill should be used when the athlete enters a base or hypertrophy phase, asks about gaining mass or building
  strength when not racing, wants a gym program for off-season, or the annual plan enters a mass-gain window. Trigger
  on "build me a hypertrophy block", "I want to gain muscle", "off-season gym plan", "mass-gain phase", "Upper/Lower
  split", "strength program for base phase", "how should I structure lifting when I'm not racing", "powerlifting block"
  (acknowledge limits), "strength-only program". Do NOT use for race-prep complementary strength: that's strength-endurance.
---

# Strength Hypertrophy: Mass and Strength Block

Program hypertrophy and general strength when strength is the primary modality for the block. Supports two profiles:

1. **Hybrid athlete**: running reduced to aerobic maintenance, strength becomes primary.
2. **Strength-only athlete**: no running, just hypertrophy/strength programming.

Strength is the priority; any other modality fills the gaps.

## Step 0: Load Context (BLOCKING)

Read: `athlete-profile.md` (Strength modality section: injuries, training background, 1RMs, body comp), `equipment.md`, `strength-log.md`, `goals.md` (body comp targets, phase duration, session budget, next race date if any), `current-block.md`.

Check `goals.md` modalities. If running is `active`, this block will be hybrid (running maintenance in parallel). If running is `dormant` or `none`, treat as strength-only.

## Evidence Base

See `references/evidence-base.md` for the full literature review behind every prescription in this skill: hypertrophy volume, frequency, proximity to failure, rep ranges, MEV/MAV/MRV, progressive overload, deloads, stretch-mediated hypertrophy, and concurrent training interference.

The short version:
- Volume is the primary driver of hypertrophy (Schoenfeld et al. 2017, dose-response meta).
- 10 to 20 sets per muscle per week, started low and progressed individually (MEV to MAV).
- 2 sessions per week per muscle is the floor for optimal frequency (Schoenfeld et al. 2019).
- Proximity to failure RIR 0 to 3 (RPE 7 to 10) is the productive window (Refalo et al. 2022 meta).
- Concurrent training: running over ~50 km/week starts to compromise lower-body hypertrophy (Wilson et al. 2012 meta). Upper body unaffected.

## Concurrent Training Principles (when running is active)

Running volume is the primary interference driver. Under 50 km/week is manageable. Upper body: unaffected by running. Lower body: 60 to 70% of strength-only gains with concurrent moderate running.

**Realistic expectations** (always communicate): 0.25 to 0.5 kg lean mass per month, 1 to 3 kg per 8 to 12 week block. Running paces 10 to 15 sec/km slower at higher body weight is expected and reverses when leaning out.

## Programming: Upper/Lower Split (Default)

**3x/week** (tight budget): Mon Upper A, Wed Lower, Fri Upper B. Running (if active): Tue easy, Thu quality 24h+ after lower, Sat long easy. Sun rest.

**4x/week** (prioritizing mass): Mon Upper A, Tue Lower A, Thu Upper B, Fri Lower B. Running (if active): Wed easy, Sat quality 24h+ after lower. Sun rest.

**Alternative splits** also evidence-supported:
- **PPL (Push/Pull/Legs)** for 6x/week strength-only athletes.
- **Full Body 3x** for beginners or limited time.

See `references/sessions-and-exercises.md` for full session templates and exercise library with alternatives. Choose the split based on session budget and equipment, not preference alone.

## Progression Protocol

**Double progression**: start bottom of rep range, add reps each session, when all sets at top of range increase weight, reps drop back. Increments: barbell +2.5 kg, DB +2 kg, machine smallest plate. Detailed in `references/evidence-base.md` (progressive overload section).

**Volume progression** within a block: start at MEV (minimum effective volume), add 1 to 2 sets per muscle every 1 to 2 weeks until MRV (maximum recoverable volume) signs appear (stalled performance, joint complaints, sleep disruption), then deload.

**1RM estimation**: Epley monthly: `1RM = weight × (1 + reps/30)`. Reliable for sub-10 rep ranges. Above 10 reps, use Brzycki or simply track working weight progression.

**Stall protocol** (stuck 3+ sessions): 1) microload (1 kg jumps), 2) change rep range (drop heavier or push higher), 3) swap exercise variant, 4) deload check, 5) flag for review.

## Deloads

Every 4 to 6 weeks, both modalities simultaneously. Strength: 40 to 50% volume, maintain intensity (do not lower the weight, lower the sets). Running: 30 to 40% volume reduction. Recovery metrics reflect total load. Both must step back together.

Triggers for early deload: HRV trending down 7+ days, sleep disrupted, joint pain emerging, performance stagnating across multiple lifts. Deloads are non-negotiable: skipping them leads to overreach, injury, or burnout. See `references/evidence-base.md` (deload section).

## Running Maintenance (when running is active)

Delegate to `running-plan-builder` for a running maintenance plan. Guidelines: 2 to 3 runs/week, mostly easy, 1 quality (15 to 20 min tempo), no long runs over 70 to 75 min. Volume 40 to 60% of race-prep.

## Body Composition Tracking

Weekly average weight (not single weigh-ins). Gaining during hypertrophy is expected. Gaining over 0.5 kg/week consistently is likely excess fat. Not gaining after 3+ weeks of training and surplus is a flag (review nutrition adherence with the user, or refer to nutritionist).

**Protein context** (not prescription): hypertrophy literature converges on 1.6 to 2.2 g/kg/day total protein (Morton et al. 2018 meta). The plugin does not prescribe nutrition. If the athlete asks about diet beyond this context, refer to a dietitian.

## Scheduling Rules

Strength sessions are the anchor. No quality running within 24 h of heavy lower. Upper + running same day is fine. Easy running the day after lower is OK (may feel heavy). One rest day minimum per microcycle.

## Output Format

See `../strength-endurance/references/plan-format.md` (shared strength plan format). Write to `<coach_dir>/plans/` as `hyp-block-[duration].md` or `strength-block-[label].md`.

Include: working weights, body comp baseline, weekly template (unified across modalities if hybrid), session details, progression rules, running cross-reference (if active), week-by-week adjustments with deloads, alternatives per exercise, **transition plan** (when block ends, propose next: strength-endurance for race prep, or another hypertrophy block, or maintenance).

After creating:
1. Request `running-plan-builder` for a running maintenance plan if running is active.
2. Update `strength-log.md`.
3. Log in `plans-shared.md`.
4. **Add or update the strength entry in `current-block.md`**: path, week 1/N, role primary, split, working weights date.
5. Offer gym log generation for week 1.

## Boundaries

Not running plans (delegate to `running-plan-builder`). Not nutrition prescription. Not physiotherapy. Not race-prep complementary strength (delegate to `strength-endurance`). Not body comp promises: realistic ranges with caveats only. Powerlifting-specific peaking is out of scope in v0.3 (future modality skill possible, see `CONTRIBUTING.md`).
