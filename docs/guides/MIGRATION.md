<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# Migration Guide

How to adopt AI Project Governance when you already have existing configuration files.

---

## Overview

If your project already has:
- `.cursorrules`
- `AGENTS.md`
- `.cursor/rules/` with custom MDC files
- Any `.ai/` structure

You should use the **migration** approach instead of fresh install.

---

## Migration Approach

### Step 1: Use --migrate Flag

```bash
# Clone governance framework
git clone https://github.com/yourorg/ai-project-governance.git /tmp/governance

# Navigate to your project
cd /path/to/your-project

# Run with --migrate (creates automatic backup)
/tmp/governance/bootstrap/scripts/init.sh --migrate --config=./governance.config.yaml
```

### Step 2: Review What Was Backed Up

The script creates a timestamped backup:

```
.governance-backup-20260101-143052/
├── .ai/                    # Your previous .ai/ if existed
├── .cursorrules            # Your previous rules
├── AGENTS.md               # Your previous agent config
└── .cursor/
    └── rules/
        └── .task-magic/    # Your previous task-magic files
```

### Step 3: Merge Your Custom Rules

#### Merging .cursorrules

Your new `.cursorrules` comes from the governance framework. To preserve custom rules:

1. Open both files:
   - **New**: `.cursorrules`
   - **Old**: `.governance-backup-*/.cursorrules`

2. Find your custom sections in the old file (typically at the end)

3. Add them to the new file under a clear header:

```markdown
# =============================================================================
# PROJECT-SPECIFIC RULES (Migrated from previous config)
# =============================================================================

# [YOUR CUSTOM SECTION]
- Your custom rule 1
- Your custom rule 2

# [ANOTHER CUSTOM SECTION]
...
```

4. Place this section **at the end** of the new `.cursorrules`

#### Merging AGENTS.md

1. Compare the new `AGENTS.md` with your backup

2. Add project-specific sections:
   - Custom key rules
   - Project-specific patterns
   - Custom references

3. Do NOT remove framework sections — add to them

#### Merging .cursor/rules/

The governance framework installs files to `.cursor/rules/.task-magic/`.

If you have other MDC files in `.cursor/rules/`:
- They can coexist with `.task-magic/`
- Check for conflicting rule names
- Framework's `tasks.mdc` and `plans.mdc` take precedence for governance workflows

---

## What Gets Overwritten vs Merged

| Item | Behavior | How to Preserve |
|------|----------|-----------------|
| `.cursorrules` | **Replaced** | Merge from backup manually |
| `AGENTS.md` | **Replaced** | Merge from backup manually |
| `.cursor/rules/.task-magic/` | **Replaced** | Files backed up, merge if needed |
| `.cursor/rules/*.mdc` (other) | **Kept** | No action needed |
| `.ai/` | **Replaced** | Previous data in backup |
| `governance.config.yaml` | **Created** if missing | Kept if exists |

---

## Merge Checklist

After migration, verify:

- [ ] Custom `.cursorrules` sections added to new file
- [ ] Custom `AGENTS.md` sections added to new file
- [ ] Custom MDC files still present (outside `.task-magic/`)
- [ ] `validate.sh --strict` passes
- [ ] No unresolved `{{PLACEHOLDER}}` patterns
- [ ] Commit includes all governance artifacts

---

## Rollback

If migration went wrong:

```bash
# Restore from backup
cp -r .governance-backup-*/.cursorrules .cursorrules
cp -r .governance-backup-*/AGENTS.md AGENTS.md
cp -r .governance-backup-*/.ai/ .ai/

# Or start fresh
rm -rf .ai/ .cursor/rules/.task-magic/ .cursorrules AGENTS.md
# Then run init again
```

---

## Conflict Resolution

### Conflicting Rule Philosophy

If your existing rules contradict governance framework:

| Conflict Type | Resolution |
|---------------|------------|
| Stricter than framework | Keep yours — add to framework rules |
| Looser than framework | Framework wins — adopt stricter rules |
| Different approach | Framework wins for core workflows; yours for project-specific |

### Conflicting Role Definitions

If you have custom AI roles:
1. Keep them in a separate section
2. Don't override the 14 framework roles
3. Add as "Project-Specific Roles" section

---

## Examples

### Example: Adding Custom API Rules

Your previous `.cursorrules` had:

```markdown
# [API RULES]
- All endpoints must return JSON
- Rate limiting required for public APIs
```

Add to new `.cursorrules` at the end:

```markdown
# =============================================================================
# PROJECT-SPECIFIC RULES
# =============================================================================

# [API RULES] (Migrated)
- All endpoints must return JSON
- Rate limiting required for public APIs
```

### Example: Custom AGENTS.md Section

Your previous `AGENTS.md` had project structure. Add to new file:

```markdown
## PROJECT-SPECIFIC STRUCTURE

(Your existing project structure documentation)
```

---

## Automation Tips

### Script to Compare Files

```bash
# Compare cursorrules
diff .governance-backup-*/.cursorrules .cursorrules | head -50

# List custom sections in old file
grep -E "^# \[" .governance-backup-*/.cursorrules
```

### Validate Merge

```bash
# Run validation
/tmp/governance/bootstrap/scripts/validate.sh --strict

# Check for leftover placeholders
grep -r "{{" .cursorrules AGENTS.md
```

---

## When to NOT Migrate

Consider fresh install instead if:

- Your existing `.cursorrules` is minimal (<50 lines)
- You've never used structured AI workflows
- Your team agrees to start fresh with governance discipline

Fresh install is simpler — migration is for preserving significant customizations.

---

**See also**: [INSTALLATION.md](INSTALLATION.md) | [CONFIGURATION.md](CONFIGURATION.md) | [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
