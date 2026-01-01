<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
-->

# AI Workflow System - Error Origin & Traceability

> **Version**: 1.0.0  
> **Status**: GOVERNANCE RULE  
> **Authority**: SUPREME (bounded by .cursorrules)

---

## Overview

The Error Origin & Traceability layer ensures that **every detected issue** is classified by its **TRUE ORIGIN LAYER** and the system enforces the **correct remediation path** automatically.

This is NOT optional. This is a **GOVERNANCE REQUIREMENT**.

---

## Core Concept: ERROR ORIGIN CLASSIFICATION

Every issue detected by any validation role **MUST** include:

1. **ORIGIN_LAYER** — Where the error truly originated
2. **PLAN_REFERENCE** — Link to feature plan assumption (if applicable)
3. **ENFORCED_NEXT_STEP** — Mandatory next action

---

## ORIGIN_LAYER Enum (Canonical)

```typescript
type ORIGIN_LAYER =
  | 'FEATURE_PLAN'        // Error in plan assumptions or design
  | 'IMPLEMENTATION'      // Error in code execution of valid plan
  | 'UI_PRESENTATION'     // Visual/UX error, logic is correct
  | 'DATA_MODEL'          // Schema, aggregation, or data structure error
  | 'EXTERNAL_DEPENDENCY' // Third-party API, service, or infra issue
  | 'DOCUMENTATION_DRIFT' // Docs don't match implementation
```

**Note**: DOCUMENTATION_DRIFT is a **SECONDARY ORIGIN** — see section below for usage rules.

---

## ORIGIN_LAYER Definitions

### FEATURE_PLAN

The error stems from an **incorrect assumption in the feature plan**.

**Examples**:
- Plan assumes API returns field X, but API returns field Y
- Plan assumes daily aggregation, but hourly is required
- Plan assumes user role has access, but permission is missing
- Plan assumes data format that doesn't exist

**Remediation**: PLANNER must update plan → IMPLEMENTER re-runs

### IMPLEMENTATION

The plan is correct, but **code doesn't match the plan**.

**Examples**:
- Off-by-one error in loop
- Wrong variable used
- Missing null check
- Incorrect SQL query for valid requirement

**Remediation**: FIXATOR may fix

### UI_PRESENTATION

Business logic is correct, but **display is wrong or misleading**.

**Examples**:
- Label says "%" but value is ratio
- Chart legend doesn't match data
- Loading state not shown
- Error message unclear

**Remediation**: FIXATOR may fix

### DATA_MODEL

Error in **data structure, schema, or aggregation logic**.

**Examples**:
- Column type wrong for use case
- Aggregation loses precision
- Missing index causes timeout
- Join produces duplicates

**Remediation**: Requires explicit authorization; may need ARCHITECT

### EXTERNAL_DEPENDENCY

Error caused by **external system** beyond our control.

**Examples**:
- Third-party API changed response format
- Cloud service rate limiting
- Network timeout
- External data corruption

**Remediation**: MONITOR_ONLY or escalation

---

## DOCUMENTATION_DRIFT — Secondary Error Origin

### Definition

Error where documentation does not match implementation:
- Docs describe feature that doesn't exist
- Docs describe incorrect behavior
- Docs reference deprecated components
- Help/guide content mismatches actual UI

### ⚠️ CRITICAL: Secondary Origin Only

**DOCUMENTATION_DRIFT may be assigned ONLY AFTER verifying:**

1. ☐ Code correctness — no implementation bugs
2. ☐ Runtime behavior — system works as coded
3. ☐ Feature plan intent — plan matches code

**It is NOT a shortcut to avoid fixing code.**

### Handling Flow

```
IF ORIGIN_LAYER = DOCUMENTATION_DRIFT:
  → CODE_DOCUMENTATOR MUST run
  → FIXATOR MAY fix code ONLY IF docs are authoritative source
  → Plan revision NOT required
  → Previous implementation remains VALID
```

---

## Mandatory Report Block

Every validation report **MUST** include this block for **each issue**:

```markdown
## Error Origin

| Field | Value |
|-------|-------|
| **ORIGIN_LAYER** | `<FEATURE_PLAN | IMPLEMENTATION | UI_PRESENTATION | DATA_MODEL | EXTERNAL_DEPENDENCY>` |
| **Feature** | `<FEATURE_CODE>` or N/A |
| **Plan Section** | `<section name>` or N/A |
| **Assumption** | `"<quoted assumption from plan>"` or N/A |
| **Evidence** | `<file:line or observation>` |
| **ENFORCED_NEXT_STEP** | `<FIXATOR | PLANNER | ARCHITECT | MONITOR_ONLY>` |
```

**Reports missing this block are INVALID.**

---

## ENFORCED_NEXT_STEP Rules

| ORIGIN_LAYER | Severity | ENFORCED_NEXT_STEP |
|--------------|----------|-------------------|
| FEATURE_PLAN | BLOCK | **PLANNER** (FIXATOR forbidden) |
| FEATURE_PLAN | WARNING | PLANNER (recommended) |
| IMPLEMENTATION | BLOCK | FIXATOR |
| IMPLEMENTATION | WARNING | FIXATOR |
| UI_PRESENTATION | BLOCK | FIXATOR |
| UI_PRESENTATION | WARNING | FIXATOR |
| DATA_MODEL | BLOCK | **ARCHITECT** (FIXATOR forbidden) |
| DATA_MODEL | WARNING | FIXATOR (if authorized) |
| EXTERNAL_DEPENDENCY | Any | MONITOR_ONLY |
| DOCUMENTATION_DRIFT | Any | **CODE_DOCUMENTATOR** |

---

## PLAN_ORIGINATED_BLOCK Rule (SUPREME)

```
IF:
  - Any issue has ORIGIN_LAYER = FEATURE_PLAN
  - AND Severity ∈ {BLOCK, BLOCK_DEPLOYMENT}

THEN:
  - FIXATOR is FORBIDDEN
  - PLANNER MUST be invoked
  - Feature Plan MUST be updated
  - Plan revision MUST be incremented
  - IMPLEMENTER MUST re-run from updated plan
  - Previous implementation is INVALID

VIOLATION = BLOCKER-level failure
```

---

## Error Traceability Artifact

For every feature with ≥1 detected issue, create/update:

```
.ai/_PLANS_VALIDATIONS/<FEATURE_CODE>/ERROR_TRACEABILITY.md
```

### Required Format

```markdown
# Error Traceability: <FEATURE_CODE>

| Issue ID | Detected By | Origin Layer | Severity | Plan Update Required | Next Step | Status |
|----------|-------------|--------------|----------|---------------------|-----------|--------|
| #1 | VALIDATOR | IMPLEMENTATION | BLOCK | No | FIXATOR | FIXED |
| #2 | UI_INSPECTOR | FEATURE_PLAN | BLOCK | **YES** | PLANNER | PENDING |
| #3 | DATA_SEMANTIC | UI_PRESENTATION | WARNING | No | FIXATOR | FIXED |

## Plan Updates Required

- Issue #2: Section "Data Display" assumption is incorrect
  - Plan revision: v1.0 → v1.1

## Remediation Log

### Issue #1
- Origin: IMPLEMENTATION
- Fixed by: FIXATOR
- Change: Added null check in `component.tsx:45`

### Issue #2
- Origin: FEATURE_PLAN
- Status: PENDING PLANNER
- Blocked: FIXATOR forbidden until plan updated
```

---

## Role Responsibilities

### VALIDATOR / UI_INSPECTOR / DATA_SEMANTIC_VALIDATOR / UI_BROWSER_VALIDATOR

**MUST**:
- Include Error Origin block for EVERY issue
- Correctly classify ORIGIN_LAYER
- Reference specific plan section if FEATURE_PLAN
- Quote assumption from plan if applicable

**MUST NOT**:
- Omit Error Origin block
- Guess origin without evidence
- Classify as IMPLEMENTATION when plan is wrong

### FIXATOR

**MUST**:
- Check ORIGIN_LAYER before acting
- Refuse if ORIGIN_LAYER = FEATURE_PLAN + BLOCK severity
- Refuse if ORIGIN_LAYER = DATA_MODEL (unless authorized)
- Document refusal reason in report

**MAY** fix:
- IMPLEMENTATION errors
- UI_PRESENTATION errors
- DATA_MODEL (only if explicitly authorized)

**MUST NOT**:
- Fix FEATURE_PLAN-originated blockers
- Mask semantic errors with implementation patches

### PLANNER

**MUST** (when invoked due to FEATURE_PLAN error):
- Identify invalid assumptions
- Correct feature plan sections
- Document changed assumptions explicitly
- Increment plan revision metadata
- Output "Semantic Corrections" section

### RE_VALIDATOR

**MUST verify**:
- All FEATURE_PLAN-originated issues triggered plan update
- Implementation corresponds to UPDATED plan (not old plan)
- Plan revision matches implementation

**MUST FAIL if**:
- Code changed without plan update (for FEATURE_PLAN issues)
- Plan updated but implementation not re-run

### CODE_DOCUMENTATOR

**MUST**:
- Extract FEATURE_PLAN-originated issues into "Semantic Corrections History"
- Reference ERROR_TRACEABILITY.md

---

## Origin Layer Decision Tree

```
START: Issue detected
    │
    ├── Is the plan assumption correct?
    │   │
    │   ├── NO → ORIGIN_LAYER = FEATURE_PLAN
    │   │        → ENFORCED_NEXT_STEP = PLANNER
    │   │
    │   └── YES → Continue
    │
    ├── Is the code correct per plan?
    │   │
    │   ├── NO → ORIGIN_LAYER = IMPLEMENTATION
    │   │        → ENFORCED_NEXT_STEP = FIXATOR
    │   │
    │   └── YES → Continue
    │
    ├── Is the display/UI correct?
    │   │
    │   ├── NO → ORIGIN_LAYER = UI_PRESENTATION
    │   │        → ENFORCED_NEXT_STEP = FIXATOR
    │   │
    │   └── YES → Continue
    │
    ├── Is the data model correct?
    │   │
    │   ├── NO → ORIGIN_LAYER = DATA_MODEL
    │   │        → ENFORCED_NEXT_STEP = ARCHITECT
    │   │
    │   └── YES → Continue
    │
    └── Is external dependency working correctly?
        │
        ├── NO → ORIGIN_LAYER = EXTERNAL_DEPENDENCY
        │        → ENFORCED_NEXT_STEP = MONITOR_ONLY
        │
        └── YES → Re-evaluate classification
```

---

## Enforcement Summary

| Condition | Result |
|-----------|--------|
| Missing ORIGIN_LAYER in report | **INVALID OUTPUT** |
| FIXATOR acts on FEATURE_PLAN BLOCK | **BLOCKER** |
| FIXATOR acts on DATA_MODEL without auth | **BLOCKER** |
| Plan update without re-implementation | **BLOCKER** |
| Implementation without plan update (for FEATURE_PLAN issues) | **BLOCKER** |
| ERROR_TRACEABILITY.md missing for feature with issues | **WARNING** |

---

## Quick Reference

```
FEATURE_PLAN error?
  → FIXATOR FORBIDDEN
  → PLANNER MUST run
  → Plan revision incremented
  → IMPLEMENTER re-runs

IMPLEMENTATION error?
  → FIXATOR runs
  → No plan change needed

UI_PRESENTATION error?
  → FIXATOR runs
  → No plan change needed

DATA_MODEL error?
  → ARCHITECT required (BLOCK)
  → FIXATOR only if authorized (WARNING)

EXTERNAL_DEPENDENCY error?
  → MONITOR_ONLY
  → Escalate if persistent
```

---

**Prev**: [09_ENFORCEMENT.md](09_ENFORCEMENT.md)  
**Next**: [README.md](README.md)
