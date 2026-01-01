<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Workflows Guide

How to use AI workflow commands effectively.

---

## Overview

Workflows are invoked using the `@workflow` command:

```
@workflow ROLE_NAME [arguments]
```

---

## Command Reference

### Planning Workflows

| Command | Purpose |
|---------|---------|
| `@workflow PLANNER` | Create feature plan |
| `@workflow ARCHITECT` | Create ADR for complex features |

### Implementation Workflows

| Command | Purpose |
|---------|---------|
| `@workflow IMPLEMENTER PREFIX` | Execute feature plan |

### Validation Workflows

| Command | Purpose |
|---------|---------|
| `@workflow VALIDATOR` | First-pass validation |
| `@workflow UI_INSPECTOR` | Visual anomaly detection |
| `@workflow DATA_SEMANTIC_VALIDATOR` | Data integrity check |
| `@workflow UI_BROWSER_VALIDATOR` | Real browser testing |

### Remediation Workflows

| Command | Purpose |
|---------|---------|
| `@workflow FIXATOR` | Fix reported issues |
| `@workflow RE_VALIDATOR` | Verify fixes |

### Documentation Workflows

| Command | Purpose |
|---------|---------|
| `@workflow CODE_DOCUMENTATOR MODULE` | Technical docs |
| `@workflow USER_DOCUMENTATOR MODE` | User docs |
| `@workflow DOC_GUARD` | Doc governance check |

### Operations Workflows

| Command | Purpose |
|---------|---------|
| `@workflow JOB_OBSERVER` | Job monitoring |
| `@workflow EMERGENCY_ERROR SOURCE` | Incident response |

---

## Workflow Patterns

### Pattern 1: New Feature

Complete flow for a new feature:

```
# Step 1: Plan
@workflow PLANNER
> Create feature plan for: Add user settings page

# Step 2: Implement  
@workflow IMPLEMENTER USER_001

# Step 3: Validate
@workflow VALIDATOR
@workflow UI_INSPECTOR

# Step 4: Fix (if issues found)
@workflow FIXATOR

# Step 5: Re-validate
@workflow RE_VALIDATOR

# Step 6: Document
@workflow CODE_DOCUMENTATOR settings
```

### Pattern 2: Bug Fix

Fix a bug without feature plan:

```
# Step 1: Validate current state
@workflow VALIDATOR

# Step 2: Fix the issue
@workflow FIXATOR

# Step 3: Re-validate
@workflow RE_VALIDATOR
```

### Pattern 3: Production Incident

Handle production issue:

```
# Step 1: Report incident
@workflow EMERGENCY_ERROR https://app.example.com/error
> [Include screenshot or error message]

# If verdict = BLOCK:
@workflow FIXATOR

# Verify fix
@workflow RE_VALIDATOR
```

### Pattern 4: Documentation Update

Update docs after code changes:

```
# Technical docs
@workflow CODE_DOCUMENTATOR api-module

# User docs for new page
@workflow USER_DOCUMENTATOR CREATE --route="/settings"

# Audit existing docs
@workflow USER_DOCUMENTATOR AUDIT
```

### Pattern 5: Complex Feature with ADR

Feature requiring architectural decision:

```
# Step 1: Create ADR
@workflow ARCHITECT
> Design decision for: Add caching layer

# Step 2: Wait for approval (14-day freeze)

# Step 3: Plan with approved architecture
@workflow PLANNER

# Step 4: Implement
@workflow IMPLEMENTER CACHE_001
```

---

## Workflow Arguments

### IMPLEMENTER

```
@workflow IMPLEMENTER FEATURE_PREFIX

# Examples
@workflow IMPLEMENTER USER_001
@workflow IMPLEMENTER ADMIN_042
@workflow IMPLEMENTER API_015
```

Resolution: Matches `{PREFIX}_*.md` in `.ai/plans/features/`

### USER_DOCUMENTATOR

```
@workflow USER_DOCUMENTATOR MODE [options]

# Modes
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"
@workflow USER_DOCUMENTATOR UPDATE
@workflow USER_DOCUMENTATOR AUDIT
```

### CODE_DOCUMENTATOR

```
@workflow CODE_DOCUMENTATOR TARGET

# Examples
@workflow CODE_DOCUMENTATOR auth-module
@workflow CODE_DOCUMENTATOR server/services/
@workflow CODE_DOCUMENTATOR ADMIN_042  # By feature code
```

### JOB_OBSERVER

```
@workflow JOB_OBSERVER [options]

# Examples
@workflow JOB_OBSERVER --job=sync-data
@workflow JOB_OBSERVER --context="Check backfill status"
```

### EMERGENCY_ERROR

```
@workflow EMERGENCY_ERROR SOURCE

# Examples
@workflow EMERGENCY_ERROR https://app.example.com/error
@workflow EMERGENCY_ERROR "Database connection timeout"
@workflow EMERGENCY_ERROR [screenshot attached]
```

---

## Execution Order

The framework enforces execution order:

```
┌──────────────────────────────────────────────────────────────┐
│                      STANDARD FLOW                            │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  PLANNER ──► IMPLEMENTER ──► DOC_GUARD ──► VALIDATOR        │
│                                               │              │
│                                               ▼              │
│                                        UI_INSPECTOR          │
│                                               │              │
│                                               ▼              │
│                                  DATA_SEMANTIC_VALIDATOR     │
│                                               │              │
│                                               ▼              │
│                                  UI_BROWSER_VALIDATOR        │
│                                               │              │
│                   ┌───────────────────────────┘              │
│                   ▼                                          │
│              ┌─────────┐                                     │
│              │ Issues? │                                     │
│              └────┬────┘                                     │
│                   │                                          │
│          YES      │      NO                                  │
│           ▼       │       ▼                                  │
│       FIXATOR     │    DONE ✓                                │
│           │       │                                          │
│           ▼       │                                          │
│     RE_VALIDATOR  │                                          │
│           │       │                                          │
│           ▼       │                                          │
│       ┌───────┐   │                                          │
│       │ Pass? │───┘                                          │
│       └───────┘                                              │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### Emergency Flow

```
EMERGENCY_ERROR ──► VALIDATOR ──► CLASSIFY
                                     │
                    ┌────────────────┴────────────────┐
                    ▼                                 ▼
               BLOCK                            NOT_BLOCK
                    │                                 │
                    ▼                                 ▼
               FIXATOR                          MONITOR ONLY
                    │
                    ▼
              RE_VALIDATOR
```

---

## Workflow Guards

Guards run automatically before each workflow:

### Pre-Workflow Checks

| Guard | What It Checks |
|-------|----------------|
| **workflow-guard** | Role permissions, prerequisites |
| **doc-guard** | Documentation requirements |
| **origin-layer-heuristics** | Error classification |

### Guard Failures

If a guard fails:

```
❌ GUARD FAILURE: workflow-guard
   Reason: Feature plan not found for prefix FEATURE_999
   Resolution: Create plan with @workflow PLANNER first
```

---

## Best Practices

### 1. Always Start with Plan

```
# ✅ Good
@workflow PLANNER
@workflow IMPLEMENTER FEATURE_001

# ❌ Bad - no plan
@workflow IMPLEMENTER FEATURE_001
```

### 2. Run Full Validation Chain for UI

```
# ✅ Complete UI validation
@workflow VALIDATOR
@workflow UI_INSPECTOR
@workflow DATA_SEMANTIC_VALIDATOR
@workflow UI_BROWSER_VALIDATOR

# ⚠️ Incomplete - might miss UI issues
@workflow VALIDATOR
```

### 3. Don't Skip RE_VALIDATOR

```
# ✅ Verify fixes
@workflow FIXATOR
@workflow RE_VALIDATOR

# ❌ Don't assume fix is correct
@workflow FIXATOR
# ...done?
```

### 4. Use EMERGENCY_ERROR for Incidents

```
# ✅ Structured incident response
@workflow EMERGENCY_ERROR "Production error"

# ❌ Ad-hoc fixing
"There's an error, let me just fix it..."
```

### 5. Document Complex Features

```
# ✅ ADR for complex decisions
@workflow ARCHITECT
# ...wait for approval...
@workflow PLANNER

# ❌ Skip ADR for major decisions
@workflow PLANNER
# "I'll add a new caching layer..."
```

---

## Troubleshooting

### "Unknown workflow command"

Verify MDC files are installed:
```bash
ls .cursor/rules/.task-magic/
```

### "Feature plan not found"

Check plan exists and prefix matches:
```bash
ls .ai/plans/features/ | grep "FEATURE_"
```

### "Guard failure"

Read guard output for specific reason. Common fixes:
- Missing prerequisite workflow
- Incomplete previous step
- Configuration issue

---

## Next Steps

- [ROLES.md](ROLES.md) — Role details
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) — Common issues
- `core/workflow/08_COMMANDS.md` — Full command reference

---

**See also**: [CONFIGURATION.md](CONFIGURATION.md) | [CUSTOMIZATION.md](CUSTOMIZATION.md)
