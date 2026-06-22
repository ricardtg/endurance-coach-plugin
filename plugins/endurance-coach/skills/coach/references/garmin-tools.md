# Garmin MCP Tool Reference

## Activity Analysis
- `get_activities(start, limit)` — paginated activity list (id, name, type, distance, duration, HR, steps)
- `get_activity(activity_id)` — full summary: duration, distance, speed, HR, cadence, stride, power, training effect/load, body battery, laps
- `get_activity_splits(activity_id)` — **per-km lap data**: distance, duration, speed, HR, calories, cadence, power, elevation. PRIMARY tool for split analysis.
- `get_activity_split_summaries(activity_id)` — whole-activity summaries by split type (RWD_RUN, INTERVAL_ACTIVE). Quick totals only.
- `get_activity_hr_in_timezones(activity_id)` — time in each HR zone
- `get_activity_weather(activity_id)` — weather conditions
- `get_training_effect(activity_id)` — aerobic/anaerobic training effect
- `get_activity_typed_splits(activity_id)` — splits by type (run vs walk)

## Wellness / Recovery
- `get_sleep_data(date)` / `get_sleep_summary(date)` — sleep quality, stages, duration
- `get_training_readiness(date)` — morning readiness score
- `get_morning_training_readiness(date)` — morning-specific readiness
- `get_body_battery(date)` / `get_body_battery_events(date)` — energy levels
- `get_stress_data(date)` / `get_stress_summary(date)` — all-day stress
- `get_heart_rates(date)` — full-day HR at 2-min resolution
- `get_rhr_day(date)` — resting heart rate
- `get_hrv_data(date)` — heart rate variability
- `get_training_status(date)` — training status (productive/unproductive/overreaching), VO2max, load
- `get_endurance_score(date)` — endurance score
- `get_race_predictions(date)` — predicted race times (5k, 10k, HM, M)

## Body Composition
- `get_body_composition(start_date, end_date)` — weight and body comp over range
- `get_daily_weigh_ins(date)` — specific day weight

## Strength Activity
- `get_activities_by_date(date, date, activity_type="strength_training")` — find gym sessions
- `get_activity(activity_id)` — duration, HR during strength

## Split Analysis Protocol

**Always** pull `get_activity_splits` for every session analyzed. Session-level averages hide the truth.

1. Pull per-km splits. Identify pace blocks (clusters of similar-pace kms).
2. Report blocks explicitly: length, pace range, HR response.
3. Never claim "no specific work done" without checking splits.
4. Quantify specific work: total km at each intensity, longest continuous block.
5. Compare to race demands: was training sufficient for what the race required?
