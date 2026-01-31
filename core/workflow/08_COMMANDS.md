<!--
AI Project Governance Framework

Author & Contact: https://x.com/God_FatherAI
License: MIT (see LICENSE file in project root)
-->

# AI Workflow System - Commands Reference

> All 17 workflow commands with examples.

---

## Command List

| Command | Role | Purpose |
|---------|------|---------|
| `@workflow EMERGENCY_ERROR <SOURCE>` | EMERGENCY_ERROR | Production incident response |
| `@workflow PLANNER` | PLANNER | Generate feature plan |
| `@workflow IMPLEMENTER <PREFIX>` | IMPLEMENTER | Execute feature plan |
| `@workflow VALIDATOR` | VALIDATOR | First-pass validation |
| `@workflow UI_INSPECTOR` | UI_INSPECTOR | Visual anomaly inspection |
| `@workflow DATA_SEMANTIC_VALIDATOR` | DATA_SEMANTIC | Semantic integrity check |
| `@workflow UI_BROWSER_VALIDATOR` | UI_BROWSER | Runtime browser validation |
| `@workflow CODE_DOCUMENTATOR <TARGET>` | CODE_DOCUMENTATOR | Technical documentation |
| `@workflow JOB_OBSERVER <CONTEXT>` | JOB_OBSERVER | Job operations / SRE |
| `@workflow USER_DOCUMENTATOR CREATE` | USER_DOCUMENTATOR | Create user docs |
| `@workflow USER_DOCUMENTATOR UPDATE` | USER_DOCUMENTATOR | Update user docs |
| `@workflow USER_DOCUMENTATOR AUDIT` | USER_DOCUMENTATOR | Audit docs sync |
| `@run HELP_INTEGRATE --route --mode` | IMPLEMENTER | Help sidebar integration |
| `@workflow FIXATOR` | FIXATOR | Fix reported issues |
| `@workflow RE_VALIDATOR` | RE_VALIDATOR | Verify fixes |
| `@workflow DOC_GUARD` | DOC_GUARD | Documentation governance |
| `@workflow AUDIT` | AUDITOR | Deep performance audit |

---

## Usage Examples

### Planning & Implementation

```markdown
# Plan a new feature
@workflow PLANNER

# Implement the approved plan
@workflow IMPLEMENTER ADMIN_001

# Implement with full plan name matching
@workflow IMPLEMENTER COPIER_INTEL_13
```

### Validation Sequence

```markdown
# First-pass validation
@workflow VALIDATOR

# Visual anomaly check
@workflow UI_INSPECTOR

# Semantic integrity check
@workflow DATA_SEMANTIC_VALIDATOR

# Real browser test
@workflow UI_BROWSER_VALIDATOR
```

### Remediation

```markdown
# Fix reported issues
@workflow FIXATOR

# Verify fixes
@workflow RE_VALIDATOR
```

### Documentation

```markdown
# Technical documentation for a feature
@workflow CODE_DOCUMENTATOR ADMIN_001

# Technical documentation for a module
@workflow CODE_DOCUMENTATOR MODULE:JOB_OBSERVABILITY

# User documentation - new route
@workflow USER_DOCUMENTATOR CREATE --route="/admin/dashboard"

# User documentation - update
@workflow USER_DOCUMENTATOR UPDATE --route="/admin/dashboard"

# User documentation - audit
@workflow USER_DOCUMENTATOR AUDIT

# Documentation governance check
@workflow DOC_GUARD
```

### Job Operations

```markdown
# Monitor job completion
@workflow JOB_OBSERVER Context: ADMIN_99 backfill completion

# Use handoff prompt
@workflow JOB_OBSERVER .ai/prompts/YYYY-MM-DD/HANDOFF_FEATURE.md
```

### Incidents

```markdown
# Production incident response
@workflow EMERGENCY_ERROR https://example.com/error "500 Error on dashboard"

# With screenshot reference
@workflow EMERGENCY_ERROR [Screenshot attached] "Dashboard stuck loading"
```

---

## Cheat Sheet

```
INCIDENT→ @workflow EMERGENCY_ERROR <SOURCE>
PLAN    → @workflow PLANNER
CODE    → @workflow IMPLEMENTER <PREFIX>
CHECK   → @workflow VALIDATOR
DOC CHK → @workflow DOC_GUARD
VISUAL  → @workflow UI_INSPECTOR
SEMANTIC→ @workflow DATA_SEMANTIC_VALIDATOR
BROWSER → @workflow UI_BROWSER_VALIDATOR
CODE DOC→ @workflow CODE_DOCUMENTATOR <TARGET>
JOB OPS → @workflow JOB_OBSERVER <CONTEXT>
DOC NEW → @workflow USER_DOCUMENTATOR CREATE
DOC UPD → @workflow USER_DOCUMENTATOR UPDATE
DOC CHK → @workflow USER_DOCUMENTATOR AUDIT
HELP UI → @run HELP_INTEGRATE --route --mode
FIX     → @workflow FIXATOR
VERIFY  → @workflow RE_VALIDATOR
```

---

## Parameter Reference

### IMPLEMENTER <PREFIX>

| Parameter | Description | Example |
|-----------|-------------|---------|
| PREFIX | Short feature code prefix | `ADMIN_001` |

Resolution: Matches files in `.ai/plans/features/` where `filename.startsWith("<PREFIX>_")`

### CODE_DOCUMENTATOR <TARGET>

| Parameter | Description | Example |
|-----------|-------------|---------|
| TARGET | Feature code or module | `ADMIN_001` |
| --existing-docs | Path to existing docs | `--existing-docs=docs/JOBS/` |

### JOB_OBSERVER <CONTEXT>

| Parameter | Description | Example |
|-----------|-------------|---------|
| CONTEXT | Free-form context | `Feature backfill monitoring` |
| HANDOFF | Path to handoff prompt | `.ai/prompts/.../HANDOFF.md` |

### HELP_INTEGRATE

| Parameter | Values | Description |
|-----------|--------|-------------|
| --route | URL path | Route to integrate |
| --mode | `empty` / `full` | Empty = infrastructure first, Full = wire up config |

### USER_DOCUMENTATOR

| Mode | When to Use |
|------|-------------|
| CREATE | New route, no docs exist |
| UPDATE | UI changed, docs need update |
| AUDIT | Before release, check sync |

---

**Prev**: [06_FILE_STRUCTURE.md](06_FILE_STRUCTURE.md)  
**Next**: [09_ENFORCEMENT.md](09_ENFORCEMENT.md)
