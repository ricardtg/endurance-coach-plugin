# Contributing to endurance-coach

Thanks for considering a contribution. This plugin is designed to be evolved, forked, and extended for different sports and goals. This guide covers the conventions and the contracts you should respect.

## Quick orientation

This is a Claude Code plugin. Each skill is a markdown-driven module with a `SKILL.md` (entry point) and `references/` (supporting docs). The plugin manifest lives in `.claude-plugin/plugin.json`. The MCP wiring (Garmin) lives in `.mcp.json`.

Skills are matched to user requests by their `description` field. Keep descriptions specific and disambiguating; vague descriptions cause misrouting.

## Local development

```bash
# Clone
git clone https://github.com/<your-fork>/endurance-coach.git
cd endurance-coach

# Install in Claude Code (development mode)
# Refer to Claude Code plugin docs for current install command.
```

Test changes by talking to the coach in a Claude Code session with this plugin loaded and a test coaching folder mounted. Cover the scenarios in `tests/scenarios/` when relevant.

## Conventions

### SKILL.md frontmatter
Every skill has YAML frontmatter:
```yaml
---
name: <skill-name-matches-directory>
description: >
  When this skill triggers. Be specific. List explicit trigger phrases.
  Note exceptions (when a sibling skill should handle it instead).
---
```

The `name` must match the directory name. The `description` is what determines triggering.

### Step 0 (blocking)
Every coaching skill begins with a Step 0 that loads context (reads `coach_dir` files, checks Garmin, etc.). Do not skip this pattern. The coach skill additionally has a Step 0.5 lifecycle gate.

### References
Long content (templates, exercise libraries, evidence reviews) goes in `references/*.md`, not inside `SKILL.md`. Keep `SKILL.md` under ~100 lines if possible.

### Citations
Evidence-based prescriptions must cite the source (author-year minimum). Full references at the bottom of the relevant file. When you add a new prescription, add the citation. When you remove one, remove the dangling citation.

### Style
- No em dashes in markdown content; use colons or commas.
- Be honest and direct, no corporate hedging.
- One sentence is often enough; expand only when the user benefits.

## Adding a new modality

The plugin is designed to support multiple sport modalities (currently `running` and `strength`; future-friendly slots for `cycling`, `swimming`, etc.). To add a new modality:

### 1. Decide if it's a separate skill or a variant

- **Separate skill** if it has its own programming logic (e.g., cycling has FTP-based zones, sweetspot blocks, distinct from VDOT running). Most modalities want their own skill.
- **Variant** if it's just a profile under an existing skill (e.g., powerlifting could in principle be a profile under `strength-hypertrophy`, though a separate skill is cleaner for any non-trivial differences).

### 2. Required contract

Every modality skill must:
- Have a `SKILL.md` with a Step 0 that reads `<coach_dir>` files.
- Read at least `athlete-profile.md` (its own modality section), `goals.md`, `current-block.md`, `training-log.md`.
- After producing a plan, **update `current-block.md`** by adding or updating its modality's entry under `Active Plans` (path, week N/Total, role, next checkpoint).
- Log the plan in `plans-shared.md`.
- Define a `references/plan-format.md` (or reference a shared one) so output structure is documented.
- Define an evidence base file (or link to existing literature) so prescriptions are defensible.

### 3. Update orchestrator and templates

- Add the modality to the `coach/references/onboarding.md` template (a section under "Modality: <Name>" in `athlete-profile.md`, an FTP/threshold/etc. field set).
- Add the modality to the `Modalities` table template in `goals.md`.
- Update `coach/SKILL.md`:
  - Add a row to the Phase Awareness table if relevant.
  - Add routing in the Delegation section.
- Update `coach/references/current-block-format.md` if the modality has unusual lifecycle requirements.

### 4. Update README and CHANGELOG

Document the new modality in the README's skills table and add an entry in CHANGELOG under the next version.

### 5. Add an example

Drop a sample plan in `examples/` so users see what good output looks like.

### 6. Add scenario tests

Add at least one entry in `tests/scenarios/` that exercises the new modality end-to-end.

## Adding a new objective profile (e.g., powerlifting)

If your contribution is a profile within an existing modality (e.g., powerlifting under `strength`), the lighter path:
1. Add a section to the existing skill's SKILL.md describing the profile.
2. Add corresponding session templates and progression rules in `references/`.
3. Update `evidence-base.md` if the literature differs (powerlifting peaking, max-strength meta-analyses, etc.).
4. Document when to use this profile vs the existing default (in the SKILL.md description and routing notes).

## PR checklist

- [ ] All edited markdown files use no em dashes.
- [ ] SKILL.md frontmatter `name` matches directory.
- [ ] Any added prescription cites its source.
- [ ] References to other files in the plugin still resolve (paths are correct).
- [ ] CHANGELOG.md updated under "Unreleased" or current bump.
- [ ] If touching modalities or lifecycle: scenario tests updated or added.
- [ ] Sample outputs in `examples/` updated if the format changed.

## Questions or proposals

Open an issue with the relevant template. For larger structural proposals (new modality, lifecycle changes, schema evolution), open a discussion first to align on direction.
