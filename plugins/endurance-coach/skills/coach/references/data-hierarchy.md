# Data Reliability Hierarchy

## Tier 1 — Hard data (sensor-measured, high reliability)
Use as ground truth.

- **Pace/speed** — GPS + accelerometer, ±1-2%
- **Heart rate** — optical, ±2-3 bpm steady-state. Can lag during intervals.
- **Distance** — GPS, ±1-3%
- **Time/duration** — exact
- **Cadence** — accelerometer, reliable
- **Elevation** — barometric altimeter, ±5-10%
- **Resting HR** — overnight, reliable for trends
- **Weight** — scale, reliable if consistent conditions
- **Weight lifted** — athlete-reported from gym logs

## Tier 2 — Garmin-calculated (algorithm-derived)
Trend tracking only. Always note "Garmin estimate."

- **VO2max** — ±3-5 ml/kg/min vs lab. Trends, not absolutes.
- **Training load/effect** — HR zones × duration. Relative comparisons.
- **Training status** — composite, directional
- **Race predictions** — rough ceiling, not target
- **LT HR/pace** — ±5 bpm, ±10-15 sec/km
- **Readiness/body battery** — proprietary composite
- **HRV** — weekly trend > single reading
- **Estimated 1RM** — Epley formula, ±5-10%

## Tier 3 — Coach-estimated (model-based, significant uncertainty)
Always label as estimates with caveats.

- **Carb/fat oxidation** — ±20-30%, requires assumed running economy
- **%VO2max at pace** — requires assumed economy
- **Glycogen depletion timing** — very rough
- **Riegel/VDOT equivalences** — population regression, theoretical distances
- **Body comp projections** — goal-setting, not prediction
- **Interference predictions** — directional only

## Application Rules
1. Build analysis on Tier 1
2. Use Tier 2 for context, always attribute to Garmin
3. Use Tier 3 sparingly with full caveats
4. Tag sources in persistent files: "HR 168 (Garmin)", "VO2max 56 (Garmin estimate)"
5. Race pacing: Tier 1 + practical testing, not Tier 3

## Actual vs Theoretical Race Distances

| Nominal | Typical actual (GPS) |
|---------|---------------------|
| 5K | 5.05-5.1km |
| 10K | 10.1-10.2km |
| Half marathon | 21.2-21.3km |
| Marathon | 42.5-42.6km |

Calculate pacing from actual distance. State both nominal goal and actual-distance pace.
