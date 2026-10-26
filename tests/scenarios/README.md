# Scenario Tests

Walkthrough-style test scenarios. Each file describes a realistic user situation, the input state of the coaching folder, the expected coach behavior, and the criteria for "this passed".

These are **manual scenarios**. A future version may convert them into automated evals. For now, the pattern is: load a test athlete folder matching the input state, drive the coach with the trigger message, and verify each criterion.

## Scenarios

| # | Filename | Theme |
|---|----------|-------|
| 1 | `01-end-of-block-no-next-race.md` | Always-active-plan rule: athlete finishes 10K, no race queued, coach must propose maintenance |
| 2 | `02-done-with-gym-no-log.md` | Gym log retro-creation when athlete trains without log |
| 3 | `03-morning-report-mid-block.md` | Morning report reads current-block and surfaces lifecycle context |
| 4 | `04-transition-race-prep-to-hypertrophy.md` | End of race season, transition to hypertrophy block |
| 5 | `05-strength-only-user.md` | Single-modality user (no running), coach skips running checks |
| 6 | `06-onboarding-plain-folder-no-garmin.md` | Onboarding without Obsidian, Garmin login guided, resume after app restart |

## How to use

1. Set up a test coaching folder with the input state described in the scenario.
2. Open Claude Code with the plugin loaded and the test folder mounted.
3. Send the trigger message.
4. Verify each criterion in the "Expected" section.
5. Note any failures in the issue tracker.
