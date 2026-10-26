# Weekly Digest Format

Pattern for any weekly view the coach produces: in-chat "weekly recap", scheduled email digest, dashboard summary. The principle is the same across channels: surface what matters now, then drill down.

## Visual Order (top to bottom)

1. **Header**: week number, date range, current phase, current block, week N of N.
2. **Totals bar**: running volume (km), strength sessions, quality sessions, modality emphasis.
3. **Warnings and flags first** (not at the bottom). Any concern, deviation, or decision the athlete needs to act on goes immediately under the header so it is visible without scrolling on mobile.
4. **Seven-day at-a-glance**: a compact index of the week (one line per day) so the athlete can find any specific day fast.
5. **Day-by-day detail**: every day Mon to Sun, not just today and tomorrow. For each day: duration, pace and HR targets (if running), sets and reps (if strength), sensations from observed data, REST days on one short line. The athlete should not need to open the full plan file to know what Wednesday looks like.
6. **Today highlighted**: visually distinct (color, callout, prefix). The athlete reads top-down and needs to spot the current day at a glance.
7. **Block context footer**: adherence percentage, end-of-block date, next checkpoint, anything looking ahead.

## Punctuation

Subjects, headers, pills and table cells follow the coach's punctuation rule: no `·` separators and no em dashes. Example subject: "Setmana 18: 14-20 set, 58 km, Calibració C dv 18" instead of "Setmana 18 · 14-20 set · 58 km". Empty cells use "-" or are left blank.

## Why this order

- **Mobile-first**: warnings at the top means the athlete sees them without scrolling.
- **Two modes of consumption**: some mornings the athlete wants the summary line, some mornings they want to read Wednesday in detail. The structure supports both.
- **Today is the anchor**: visually distinguishing today removes the need to mentally compute "where am I in this week".
- **Block context** comes last because it is reference, not action.

## In-Chat Weekly Recap Adaptation

In a chat reply (not an email or dashboard), respect the same order but drop the visual styling: warnings as a short paragraph at the top, totals as a one-line bullet, day-by-day as a compact list, today marked with **bold prefix** like "**AVUI** Wed: ...". Keep it tight; an in-chat recap should fit in a single screen.

## Email / Scheduled Digest Adaptation

If the digest is rendered as HTML email or dashboard:
- Use a clear color callout for today (light yellow background works well).
- Warnings in a distinct callout color (yellow or amber).
- Header in a phase-appropriate color.
- Keep the seven-day index clickable / scroll-anchored to each day's detail block.

## Content Per Day

For a running day:
- Session label (Easy 10 km / Threshold 4x1.5 km / Long 18 km).
- Target pace range and HR target.
- Any tempo or interval substructure.
- Sensations to expect ("aerobic, conversational" or "controlled discomfort by rep 3").

For a strength day:
- Split name (Lower A / Upper B).
- Working weights for the main lifts (or pointer to gym log file).
- RPE / RIR target.
- Sets and reps schema.

For a rest day:
- One line: "REST, sleep priority" or "Active recovery only, easy walk if you want".

For a doubles day:
- List both sessions in order, with the gap.

## Schedule

If the digest is delivered on a schedule (e.g., weekly email Sunday evening or Monday morning), implement it as a Scheduled Task with the spec living near the digest format reference. Keep PII (specific athlete name, email route) out of the spec; the schedule belongs to the athlete's setup, the format belongs to the plugin.
