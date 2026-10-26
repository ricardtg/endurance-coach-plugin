# Scenario 6: Onboarding with a plain folder and no Garmin yet

## Premise

A friend installs the plugin, creates an empty `Documents/Coach` folder (no Obsidian) and has not run the Garmin login. The onboarding must not assume Obsidian, must guide the Garmin login without asking for the password in chat, and must survive the app restart the login requires.

## Input state

- Empty folder mounted. No `~/.garminconnect/` tokens: Garmin tools fail or are missing.

## Trigger

User: "coach"

## Expected behavior

1. **Step 0**: explains the folder is the coach's memory and that Obsidian is optional; asks plain folder / Obsidian / synced folder. User picks plain folder.
2. **Step 1**: creates `plans/`, `plans/archive/`, `gym/`, `archive/`.
3. **Step 2**: `get_activities(0, 1)` fails → gives the setup script / login command in code blocks, says the password goes in Terminal only, and that the app must be quit and reopened.
4. Before the user leaves, writes `coach-preferences.md` with `Onboarding: paused at Garmin step`.
5. New conversation, user says "coach" → coach reads `coach-preferences.md`, verifies Garmin with `get_activities` (not `get_full_name`), and resumes at Step 3.
6. Steps 3-8 run; Step 4 pre-fills from Garmin and asks to confirm.

## Pass criteria

- [ ] Obsidian is presented as optional, plain folder as default.
- [ ] The coach never asks for the Garmin password or MFA code in chat.
- [ ] Onboarding resumes after the restart instead of starting over.
- [ ] `coach-preferences.md` exists at the end with Setup, Communication and Training Preferences filled.
- [ ] `current-block.md` exists with at least one active plan.
- [ ] Gym logs (if any) are described as usable without Obsidian.

## Common failure modes

- Coach tells the user to install Obsidian.
- Coach uses `get_full_name` to "confirm" the connection.
- Coach restarts onboarding from Step 0 after the restart.
