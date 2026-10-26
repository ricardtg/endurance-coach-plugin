# Garmin Setup & Troubleshooting

The plugin bundles a Garmin Connect MCP server ([Taxuspt/garmin_mcp](https://github.com/Taxuspt/garmin_mcp), pinned to a reviewed commit in `.mcp.json`). It runs on the athlete's own computer and reads Garmin with tokens stored in `~/.garminconnect/`. **Garmin is optional**: without it the coach works from what the athlete reports.

Use this file when onboarding a new athlete, and whenever a Garmin call fails.

## What the athlete needs (one time)

1. **uv** (runs the Garmin server). Check in Terminal: `uvx --version`.
   - Mac with Homebrew: `brew install uv`
   - Mac/Linux without Homebrew: `curl -LsSf https://astral.sh/uv/install.sh | sh`
   - Windows (PowerShell): `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`
2. **Log in to Garmin once, in Terminal**. The repo ships `scripts/setup-garmin.sh` (Mac/Linux), which installs uv if missing, warns that the password is invisible while typing, and runs the login. **One-line setup** (Mac/Linux, the line to give non-technical athletes; step 1 is then not needed):
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ricardtg/endurance-coach-plugin/main/scripts/setup-garmin.sh)"
   ```
   Manual equivalent (Windows too, after installing uv):
   ```
   uvx --python 3.12 --from git+https://github.com/Taxuspt/garmin_mcp@a2ca5fcac34524b83814fe2fcf3d479f8a75983f garmin-mcp-auth
   ```
   It asks for the Garmin email, password and, if the account has 2-step verification, the code Garmin sends by email/SMS. It ends with `SUCCESS` and `Logged in as: <name>`.
3. **Fully quit and reopen the Claude app** (Cmd+Q on Mac). The Garmin server only reads the tokens when it starts.

Tell the athlete plainly:
- The password is typed in **their** Terminal, never in the chat. Claude never sees it. Only tokens are saved, in `~/.garminconnect/` on their computer.
- Tokens last about **6 months**. When they expire, they repeat step 2 and 3. Nothing else is lost.
- Never paste a password or an MFA code into the chat. If they do, tell them to change the Garmin password.

The coach cannot run the login for them: it needs an interactive terminal for the password and the MFA code.

## Verify the connection

Call `get_activities(0, 1)` (or `get_devices`). If it returns the latest activity, it works.

Do **not** use `get_full_name` as a check: it answers from a cached profile without any HTTP call and keeps working with dead tokens.

## Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| No Garmin tools at all | Server did not start: uv missing, or the app was not restarted | Check `uvx --version` in Terminal; install uv; quit and reopen Claude |
| No Garmin tools, uv is installed | The app cannot see uv on its PATH (common when uv was installed to `~/.local/bin`) | Install with Homebrew (`brew install uv`), or restart the computer after installing; then reopen Claude |
| `401`, or "Garmin Connect is unreachable. Check your network connection" | **Expired tokens**, not the network | Re-authenticate (below) |
| "OAuth tokens not found and no interactive terminal available" | Never logged in on this computer | Run the login (step 2), restart the app |
| "MFA code may be incorrect or expired" | Old code | Request a new code and rerun the login |
| "Too many requests" | Garmin rate limit after several attempts | Wait 10-15 minutes, then retry once |
| Garmin China account | Different region | Add `--is-cn` to the login command and set `GARMIN_IS_CN=true` in the plugin env (advanced) |

### Re-authenticate

```
uvx --python 3.12 --from git+https://github.com/Taxuspt/garmin_mcp@a2ca5fcac34524b83814fe2fcf3d479f8a75983f garmin-mcp-auth --force-reauth
```

Then quit and reopen the Claude app. While Garmin is down, keep coaching from the tracker and ask the athlete for the missing numbers (distance, time, average HR) instead of guessing.

### Diagnosing from Terminal

The same login command accepts `--verify` (do the saved tokens still work?) and `--diagnose` (where tokens are looked up, what is there, and whether they work). Give the athlete the command with one of these flags instead of asking them to inspect files.

`oauth1_token.json` and `oauth2_token.json` in `~/.garminconnect/` are the files that matter; a `garmin_tokens.json` belongs to a different tool.

## Updating the pinned server (maintainer)

The server version is pinned in `plugins/endurance-coach/.mcp.json`, in this file and in `scripts/setup-garmin.sh`. To move to a newer upstream commit: read the upstream diff, update the commit hash in all three places, bump the plugin version, and test `get_activities`, `get_sleep_summary` and `upload_workout` before publishing.
