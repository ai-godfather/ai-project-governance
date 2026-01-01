<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# Roles Guide

Understanding the 14 AI workflow roles and how to use them.

---

## Overview

The framework defines 14 specialized roles, each with strict boundaries:

| Category | Roles | Purpose |
|----------|-------|---------|
| **Incident** | EMERGENCY_ERROR | Production incidents |
| **Planning** | PLANNER, ARCHITECT | Design and decisions |
| **Implementation** | IMPLEMENTER | Code execution |
| **Validation** | VALIDATOR, UI_INSPECTOR, DATA_SEMANTIC_VALIDATOR, UI_BROWSER_VALIDATOR | Quality checks |
| **Remediation** | FIXATOR, RE_VALIDATOR | Issue resolution |
| **Documentation** | CODE_DOCUMENTATOR, USER_DOCUMENTATOR, DOC_GUARD | Documentation |
| **Operations** | JOB_OBSERVER | SRE/Operations |

---

## Role Boundaries

### Implementation Authority

Only **IMPLEMENTER** can write code:

| Role | Can Write Code? |
|------|-----------------|
| PLANNER | ❌ No |
| **IMPLEMENTER** | ✅ **Yes** |
| VALIDATOR | ❌ No |
| FIXATOR | ✅ Fixes only |
| All others | ❌ No |

### Mode Summary

| Mode | Description | Roles |
|------|-------------|-------|
| **Read-Only** | Can read, analyze, report | PLANNER, VALIDATOR, inspectors |
| **Write (Scoped)** | Limited write access | IMPLEMENTER, FIXATOR |
| **Orchestrator** | Coordinates other roles | EMERGENCY_ERROR |
| **Operational** | Runtime operations | JOB_OBSERVER |
| **Advisory** | Suggestions only | DOC_GUARD |

---

## Role Details

### 0. EMERGENCY_ERROR

**Purpose**: Handle production incidents.

```
@workflow EMERGENCY_ERROR https://example.com/error
@workflow EMERGENCY_ERROR "Error message" [screenshot]
```

**Flow**:
1. Context freeze
2. Run VALIDATOR
3. Classify incident
4. Issue verdict (BLOCK/NOT_BLOCK)
5. Report

**Classifications**:
- `ACTIVE_BLOCKER` → FIXATOR required
- `RECOVERED_TRANSIENT` → Monitor only
- `HISTORICAL_ARTIFACT` → No action
- `UI_PRESENTATION_ONLY` → Optional fix

---

### 1. PLANNER

**Purpose**: Create feature plans.

```
@workflow PLANNER
```

**Rules**:
- MUST read `docs/AI_PLANNER_GUARDRAILS.md` first
- MUST scan existing system before designing
- MUST NOT write code or generate tasks
- Output: `.ai/plans/features/{PREFIX}_*.md`

**Example Output**:
```markdown
# FEATURE_001_Add_Health_Check

## Overview
Add /health endpoint for monitoring.

## Implementation Tasks
1. Create healthRouter
2. Add database ping
3. Add endpoint to main router
```

---

### 2. IMPLEMENTER

**Purpose**: Execute feature plans.

```
@workflow IMPLEMENTER FEATURE_001
```

**Resolution**:
- Scans `.ai/plans/features/`
- Matches `FEATURE_001_*.md`
- EXACTLY 1 match = proceed
- 0 or >1 = FAIL

**Rules**:
- Execute plan VERBATIM
- No scope expansion
- No self-validation
- Update TASKS.md and changelog

---

### 3. VALIDATOR

**Purpose**: First-pass code validation.

```
@workflow VALIDATOR
```

**Checks**:
- FP-002: Non-deterministic mocks
- FP-004: Migration sync
- FP-005: Schema-code sync
- FP-008: Index usage
- FP-014: Aggregate limits
- FP-016: Memory limits

**Output**: `.ai/_PLANS_VALIDATIONS/<FEATURE>/VALIDATION_*.md`

---

### 4. UI_INSPECTOR

**Purpose**: Detect visual/UX anomalies.

```
@workflow UI_INSPECTOR
```

**Detects**:
- ×100 errors (ratio as percentage)
- Missing data shown as zero
- Non-persistent ID used as stable
- Misleading labels

**Output**: `UI_INSPECTION_*.md`

---

### 5. DATA_SEMANTIC_VALIDATOR

**Purpose**: Detect semantic data issues.

```
@workflow DATA_SEMANTIC_VALIDATOR
```

**Detects**:
- Unit mismatches
- Time-window mismatches
- Small sample sizes
- Aggregation artifacts

**Output**: `DATA_SEMANTIC_VALIDATION_*.md`

---

### 6. UI_BROWSER_VALIDATOR

**Purpose**: Real browser validation.

```
@workflow UI_BROWSER_VALIDATOR
```

**Uses**: MCP Browser / Playwright

**Detects**:
- Dead clicks
- Silent API failures
- Infinite loading
- Console errors

**Verdicts**: BLOCK | CONDITIONAL_PASS | PASS

---

### 7. FIXATOR

**Purpose**: Fix reported issues.

```
@workflow FIXATOR
```

**Scope Lock**:
- ✅ Fix BLOCKER issues only
- ❌ No scope expansion
- ❌ No logic changes
- ❌ No new features

**Must Refuse If**:
- ORIGIN_LAYER = FEATURE_PLAN + BLOCK
- ORIGIN_LAYER = DATA_MODEL (unauthorized)

---

### 8. RE_VALIDATOR

**Purpose**: Verify fixes.

```
@workflow RE_VALIDATOR
```

**Checks**:
- Each reported issue is resolved
- No new issues introduced
- Fix doesn't hide the problem

---

### 9. ARCHITECT

**Purpose**: Create Architecture Decision Records.

```
@workflow ARCHITECT
```

**Triggers**:
- External dependencies
- Schema changes (≥3 tables)
- New jobs/schedulers
- Execution model changes

**Output**: `.ai/ADR/{feature}-adr.md`

**Requirements**:
- ≥3 alternatives with trade-offs
- Reversibility cost assessment
- Decision freeze period

---

### 10. CODE_DOCUMENTATOR

**Purpose**: Technical documentation.

```
@workflow CODE_DOCUMENTATOR MODULE_NAME
```

**Modes**:
- CREATE_FROM_SCRATCH
- UPDATE_EXISTING
- EXTEND_MODULE_DOCS

**Hierarchy**: Code > Plans > Docs > Assumptions

**Output**: `docs/<MODULE>/`

---

### 11. USER_DOCUMENTATOR

**Purpose**: User-facing documentation.

```
@workflow USER_DOCUMENTATOR CREATE --route="/dashboard"
@workflow USER_DOCUMENTATOR UPDATE
@workflow USER_DOCUMENTATOR AUDIT
```

**Modes**:
- CREATE: New route docs
- UPDATE: UI change updates
- AUDIT: Check doc sync

---

### 12. JOB_OBSERVER

**Purpose**: Job operations (SRE role).

```
@workflow JOB_OBSERVER --job=sync-data
```

**Allowed**:
- ✅ Diagnose job states
- ✅ Pause/resume schedulers
- ✅ Transition modes

**Forbidden**:
- ❌ Code changes
- ❌ Enable deprecated jobs

---

### 13. DOC_GUARD

**Purpose**: Documentation governance.

```
@workflow DOC_GUARD
```

**Principle**: Cannot block work, must block lies.

**Hard Blockers (only 2)**:
1. New job without `docs/JOBS/` 
2. Dangerous op modified without safety docs

All other cases: Advisory only.

---

## Role Invocation Patterns

### Feature Development

```
1. @workflow PLANNER           # Create plan
2. @workflow ARCHITECT         # If complex (optional)
3. @workflow IMPLEMENTER X     # Execute plan
4. @workflow DOC_GUARD         # Check docs (optional)
5. @workflow VALIDATOR         # Validate code
6. @workflow UI_INSPECTOR      # Check UI
7. @workflow FIXATOR           # Fix issues
8. @workflow RE_VALIDATOR      # Verify fixes
```

### Production Incident

```
1. @workflow EMERGENCY_ERROR <source>
   → Automatically runs VALIDATOR
   → Issues BLOCK or NOT_BLOCK
2. @workflow FIXATOR           # Only if BLOCK
3. @workflow RE_VALIDATOR      # Verify fix
```

### Documentation Update

```
1. @workflow CODE_DOCUMENTATOR MODULE
   OR
1. @workflow USER_DOCUMENTATOR CREATE --route=/X
```

---

## Error Origin Layer

When validation finds issues, classify by origin:

| Origin | Fix By | Example |
|--------|--------|---------|
| `FEATURE_PLAN` | PLANNER | Wrong assumption in plan |
| `IMPLEMENTATION` | FIXATOR | Bug in code |
| `UI_PRESENTATION` | FIXATOR | Label typo |
| `DATA_MODEL` | ARCHITECT | Schema issue |
| `EXTERNAL_DEPENDENCY` | ESCALATE | Third-party bug |

---

## Best Practices

### 1. Start with PLANNER

Always plan before implementing:
```
@workflow PLANNER
```

### 2. Use Validation Chain

Run all validators for UI features:
```
@workflow VALIDATOR
@workflow UI_INSPECTOR
@workflow DATA_SEMANTIC_VALIDATOR
@workflow UI_BROWSER_VALIDATOR
```

### 3. Respect Scope Lock

FIXATOR must not expand scope — if issue requires design change, go back to PLANNER.

### 4. Document Decisions

For complex features, use ARCHITECT first:
```
@workflow ARCHITECT
```

---

## Next Steps

- [WORKFLOWS.md](WORKFLOWS.md) — Workflow commands
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) — Common issues
- `core/workflow/03_ROLES.md` — Full role definitions

---

**See also**: [CONFIGURATION.md](CONFIGURATION.md) | [CUSTOMIZATION.md](CUSTOMIZATION.md)
