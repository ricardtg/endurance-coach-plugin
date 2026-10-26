# endurance-coach plugin

Coach for hybrid (running + strength) or single-sport athletes. Install and first-run instructions: see the [repo README](../../README.md).

## Skills

| Skill | Role | Triggers |
|-------|------|----------|
| **coach** | Orchestrator: onboarding, daily coaching, session tracking, reports, gym logs, block lifecycle | "coach", "morning report", "done with my run", "done with gym", "weekly recap", "what's my week" |
| **running-plan-builder** | Running plan creation and evaluation | "build me a 10K plan", "evaluate this plan", "running maintenance plan" |
| **strength-endurance** | Complementary strength during race prep | "strength plan for my HM prep" |
| **strength-hypertrophy** | Hypertrophy or strength-primary blocks | "build me a hypertrophy block", "I want to gain muscle" |

## Athlete folder

Plain markdown in one folder. Works as a normal folder, a synced folder or an Obsidian vault; Obsidian only adds tickable gym logs on the phone.

```
<coach folder>/
├── coach-preferences.md   → how this athlete wants to be coached (read first)
├── athlete-profile.md     → stats, PRs, markers, strength baselines, injuries
├── goals.md               → modalities, races, body comp, periodization
├── current-block.md       → what is active right now (read every time)
├── training-log.md        → cross-session synthesis and lessons
├── strength-log.md        → working weights and progression
├── equipment.md           → gym equipment and exercise preferences
├── plans-shared.md        → external plans submitted for review
├── plans/                 → plans and trackers (archive/ for finished ones)
├── gym/                   → one log per gym session (✅ prefix once done)
└── archive/
```

Templates: `skills/coach/references/onboarding.md`. Samples: [`examples/`](../../examples).

## Garmin

Bundled MCP server ([Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp)) pinned to a reviewed commit in `.mcp.json`, run with `uvx`. Requires a one-time login in Terminal. Setup, troubleshooting and how to bump the pin: `skills/coach/references/garmin-setup.md`.

## Design rules

- The athlete's folder is the only state. App memory is not used for coaching rules; corrections go to `coach-preferences.md`.
- Updates never overwrite athlete files; migration only creates missing files and appends missing sections.
- Nothing athlete-specific lives in the plugin. If a rule is only true for one athlete, it belongs in their `coach-preferences.md`.
