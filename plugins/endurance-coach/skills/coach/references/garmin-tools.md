# Garmin MCP Tool Reference

## Activity Analysis
- `get_activities(start, limit)`: paginated activity list (id, name, type, distance, duration, HR, steps)
- `get_activity(activity_id)`: full summary: duration, distance, speed, HR, cadence, stride, power, training effect/load, body battery, laps
- `get_activity_splits(activity_id)`: **per-km lap data**: distance, duration, speed, HR, calories, cadence, power, elevation. PRIMARY tool for split analysis.
- `get_activity_split_summaries(activity_id)`: whole-activity summaries by split type (RWD_RUN, INTERVAL_ACTIVE). Quick totals only.
- `get_activity_hr_in_timezones(activity_id)`: time in each HR zone
- `get_activity_weather(activity_id)`: weather conditions
- `get_training_effect(activity_id)`: aerobic/anaerobic training effect
- `get_activity_typed_splits(activity_id)`: splits by type (run vs walk)

## Wellness / Recovery
- `get_sleep_data(date)` / `get_sleep_summary(date)`: sleep quality, stages, duration
- `get_training_readiness(date)`: morning readiness score
- `get_morning_training_readiness(date)`: morning-specific readiness
- `get_body_battery(date)` / `get_body_battery_events(date)`: energy levels
- `get_stress_data(date)` / `get_stress_summary(date)`: all-day stress
- `get_heart_rates(date)`: full-day HR at 2-min resolution
- `get_rhr_day(date)`: resting heart rate
- `get_hrv_data(date)`: heart rate variability
- `get_training_status(date)`: training status (productive/unproductive/overreaching), VO2max, load
- `get_endurance_score(date)`: endurance score
- `get_race_predictions(date)`: predicted race times (5k, 10k, HM, M)

## Body Composition
- `get_body_composition(start_date, end_date)`: weight and body comp over range
- `get_daily_weigh_ins(date)`: specific day weight

## Strength Activity
- `get_activities_by_date(date, date, activity_type="strength_training")`: find gym sessions
- `get_activity(activity_id)`: duration, HR during strength

## Split Analysis Protocol

**Always** pull `get_activity_splits` for every session analyzed. Session-level averages hide the truth.

1. Pull per-km splits. Identify pace blocks (clusters of similar-pace kms).
2. Report blocks explicitly: length, pace range, HR response.
3. Never claim "no specific work done" without checking splits.
4. Quantify specific work: total km at each intensity, longest continuous block.
5. Compare to race demands: was training sufficient for what the race required?
6. Per-km splits are still 1 km averages. A single fast final km is usually a short end sprint, not a sustained surge.

## Pushing Workouts to the Watch

- `create_run_workout` / `create_walk_run_workout` only take an HR zone target. Fine for easy runs, **not for quality sessions**.
- Quality sessions (tempo, intervals, race-pace) go through `upload_workout` with a JSON workout DTO whose step target is **pace** (`targetType` pace.zone, `workoutTargetTypeId` 6). `targetValueOne` / `targetValueTwo` are in m/s: low = slower pace, high = faster pace. Conversion: `m/s = 1000 / seconds_per_km`.
- Use a generous band so the watch does not beep at normal oscillation. Example: tempo at 4:00-4:06/km → band 3:55-4:15/km = 3.9216-4.2553 m/s.
- Race-day workouts use the operational pace (goal time ÷ expected GPS distance), see `data-hierarchy.md`.
- After uploading, verify with `get_workout_by_id`, then `schedule_workout` for the date.

## Known Unit Traps

| Field | Looks like | Actually is |
|-------|-----------|-------------|
| `get_lactate_threshold` → `speed_history[].speed_mps` | m/s | **value × 100 = seconds per km** (2.3529 → 3:55/km) |
| `get_lactate_threshold` → `power_history` | watts | watts (real) |
| Activity `averageSpeed`, split `speed` | m/s | m/s (real) |

Rule: before interpreting a field you have not used before, validate it against a value already recorded in the athlete's files. Add new traps to this table upstream.

## Recovery Data Validity

- A resting HR is only valid if `get_sleep_summary(date)` has a recorded night **and** the readiness HRV factor is not `NONE`. Otherwise Garmin shows a daytime minimum. For a series, check every date.
- Readiness computed without sleep (sleep, HRV, stress history factors all 0/NONE) only reflects the recovery timer from the last session. Do not present it as how rested the athlete is.
- Overnight HRV and RHR are valid even when the sleep *score* looks off (naps, late bedtime).

## Connection Checks

- `get_full_name` is a **false positive**: it answers from a cached profile with no HTTP call, even with expired tokens. Use `get_activities(0, 1)` or `get_devices` to test the connection.
- "Garmin Connect is unreachable. Check your network connection" together with `401` means **expired authentication**, not a network problem. Follow `garmin-setup.md` → Re-authenticate.
