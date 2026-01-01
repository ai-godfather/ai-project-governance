<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
-->

# Origin Layer Heuristics — Auto-Detection Guide

> **Version**: 1.0.0  
> **Status**: SUGGESTION SYSTEM (not enforcement)  
> **Purpose**: Help validators correctly classify ORIGIN_LAYER

---

## Overview

These heuristics **SUGGEST** ORIGIN_LAYER based on issue characteristics.
Validators MUST confirm or override with evidence.

```
ISSUE DETECTED
      │
      ▼
APPLY HEURISTICS
      │
      ▼
SUGGESTED_ORIGIN: FEATURE_PLAN (based on FP-039)
      │
      ▼
VALIDATOR CONFIRMS OR OVERRIDES
      │
      ▼
FINAL ORIGIN_LAYER (with evidence)
```

---

## Heuristic 1: FEATURE_PLAN Indicators

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "plan assumes" | HIGH | "Plan assumes API returns percentage" |
| "assumption" | HIGH | "Assumption that data is complete" |
| "plan says X but actual is Y" | VERY HIGH | "Plan says daily, actual is hourly" |
| "requirement mismatch" | HIGH | "Requirement doesn't match capability" |
| "design decision" | MEDIUM | "Design decision to use AVG is wrong" |
| "semantic mismatch" | HIGH | "Semantic mismatch between plan and data" |

### Failure Pattern Triggers

| FP-ID | Description | ORIGIN = FEATURE_PLAN? |
|-------|-------------|----------------------|
| FP-019 | UI promise without backend guarantee | ✅ YES |
| FP-035 | Misleading label/legend | ✅ YES (if plan terminology wrong) |
| FP-039 | Inappropriate aggregation method | ✅ YES |
| FP-040 | Small sample size hidden by precision | ✅ YES |
| FP-041 | Time-window mismatch | ✅ YES |

### Structural Indicators

- Issue references specific plan section
- Issue quotes assumption from plan
- Issue affects core business logic semantics
- Issue requires "rethinking approach"
- Fix would change what data MEANS, not how it's computed

### Suggested Output

```
SUGGESTED_ORIGIN: FEATURE_PLAN
CONFIDENCE: HIGH
REASON: FP-039 detected (inappropriate aggregation method) + issue mentions "plan assumes AVG"
PLAN_SECTION: "Data Display Requirements"
QUOTED_ASSUMPTION: "Use AVG for performance metrics"
```

---

## Heuristic 2: IMPLEMENTATION Indicators

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "off-by-one" | VERY HIGH | "Off-by-one error in loop" |
| "null check" | HIGH | "Missing null check" |
| "undefined" | HIGH | "Variable is undefined" |
| "typo" | VERY HIGH | "Typo in variable name" |
| "wrong variable" | VERY HIGH | "Used wrong variable" |
| "missing await" | VERY HIGH | "Missing await on async call" |
| "incorrect condition" | HIGH | "Condition logic is inverted" |

### Failure Pattern Triggers

| FP-ID | Description | ORIGIN = IMPLEMENTATION? |
|-------|-------------|-------------------------|
| FP-002 | State snapshot mismatch | ✅ YES |
| FP-004 | Migration production file sync | ✅ YES |
| FP-005 | Schema-code synchronization | ✅ YES |
| FP-008 | Env variable drift | ✅ YES |
| FP-016 | O(n²) in user path | ✅ YES |
| FP-042 | Dead click | ✅ YES |
| FP-043 | Silent API failure | ✅ YES |
| FP-044 | Infinite loading | ✅ YES |

### Structural Indicators

- Issue is about HOW code is written, not WHAT it does
- Plan is correct, code doesn't follow it
- Fix is localized to specific lines
- Fix doesn't change semantic meaning
- Standard bug pattern (null, async, loop, condition)

---

## Heuristic 3: UI_PRESENTATION Indicators

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "label" | HIGH | "Label says 'Total' but shows partial" |
| "tooltip" | HIGH | "Tooltip contradicts data" |
| "legend" | HIGH | "Chart legend is misleading" |
| "format" | MEDIUM | "Number format is confusing" |
| "color" | MEDIUM | "Color coding is inverted" |
| "display" | MEDIUM | "Display shows 0 for null" |
| "visual" | MEDIUM | "Visual representation is wrong" |

### Failure Pattern Triggers

| FP-ID | Description | ORIGIN = UI_PRESENTATION? |
|-------|-------------|--------------------------|
| FP-033 | Numeric display anomaly | ✅ YES |
| FP-034 | Visual contradiction | ✅ YES |
| FP-036 | Ratio shown as percentage | ✅ YES |
| FP-037 | Missing data shown as zero | ✅ YES |

### Structural Indicators

- Backend logic is correct
- Data returned from API is correct
- Issue is only in how data is rendered
- Fix is in UI component only
- No semantic meaning change

---

## Heuristic 4: DATA_MODEL Indicators

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "schema" | HIGH | "Schema doesn't support this use case" |
| "column" | MEDIUM | "Column type is wrong" |
| "table" | MEDIUM | "Table structure doesn't fit" |
| "migration" | HIGH | "Requires migration" |
| "aggregation" | MEDIUM | "Aggregation method is wrong" |
| "index" | MEDIUM | "Missing index causes timeout" |
| "join" | MEDIUM | "Join produces duplicates" |

### Failure Pattern Triggers

| FP-ID | Description | ORIGIN = DATA_MODEL? |
|-------|-------------|---------------------|
| FP-010 | Raw SQL outside migration | ✅ YES |
| FP-014 | Aggregation precision loss | ✅ YES |
| FP-065 | Query using calculated date without check | ✅ YES |
| FP-066 | Query strategy inconsistency | ✅ YES |
| FP-067 | Snapshot table aggregation double-counting | ✅ YES |

### Structural Indicators

- Issue requires schema change
- Issue is about data structure, not code
- Fix affects multiple features
- Requires ARCHITECT decision
- Migration would be needed

---

## Heuristic 5: EXTERNAL_DEPENDENCY Indicators

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "API" | MEDIUM | "External API changed format" |
| "third-party" | HIGH | "Third-party service is down" |
| "rate limit" | VERY HIGH | "Rate limited by external service" |
| "timeout" | MEDIUM | "Timeout from external call" |
| "network" | MEDIUM | "Network error" |
| "service" | MEDIUM | "Service unavailable" |

### Structural Indicators

- Issue is outside our codebase
- We cannot fix the root cause
- Issue may resolve itself
- Requires monitoring, not fixing
- External documentation needed

---

## Heuristic 6: DOCUMENTATION_DRIFT Indicators

### ⚠️ SECONDARY ORIGIN — Verification Required First

DOCUMENTATION_DRIFT may be assigned **ONLY AFTER**:

1. ☐ Code correctness verified (no implementation bugs)
2. ☐ Runtime behavior verified (system works as coded)
3. ☐ Feature plan intent verified (plan matches code)

**It is NOT a shortcut to avoid fixing code.**

### Text Patterns

| Pattern | Confidence | Example |
|---------|------------|---------|
| "docs say X but code does Y" | VERY HIGH | "Docs say daily, code runs hourly" |
| "documentation outdated" | HIGH | "README references removed feature" |
| "help content wrong" | HIGH | "Tooltip describes old behavior" |
| "stale documentation" | MEDIUM | "Last updated 6 months ago" |
| "doc mismatch" | HIGH | "User guide doesn't match UI" |

### FORBIDDEN Shortcuts

| Shortcut | Why Forbidden |
|----------|---------------|
| ❌ Assigning DOCUMENTATION_DRIFT without verifying code | May hide real bugs |
| ❌ Using DOCUMENTATION_DRIFT to avoid implementation fix | Code correctness is priority |
| ❌ Blaming docs when code is actually wrong | Docs are secondary source of truth |

---

## Decision Tree

```
START: Issue detected
    │
    ├── Does issue mention "assumption", "plan says", or reference plan section?
    │   └── YES → SUGGEST: FEATURE_PLAN
    │
    ├── Is it a coding bug? (null, typo, off-by-one, missing await)
    │   └── YES → SUGGEST: IMPLEMENTATION
    │
    ├── Is issue only about display/labels/formatting?
    │   └── YES → SUGGEST: UI_PRESENTATION
    │
    ├── Does issue require schema change or migration?
    │   └── YES → SUGGEST: DATA_MODEL
    │
    ├── Is issue caused by external service?
    │   └── YES → SUGGEST: EXTERNAL_DEPENDENCY
    │
    └── Is code correct but docs are wrong?
        └── YES → VERIFY CODE FIRST → SUGGEST: DOCUMENTATION_DRIFT
```

---

## Confidence Levels

| Level | Meaning | Validator Action |
|-------|---------|-----------------|
| VERY HIGH | Almost certainly correct | Confirm with minimal review |
| HIGH | Likely correct | Verify key evidence |
| MEDIUM | Possible, needs review | Investigate thoroughly |
| LOW | Uncertain | Override likely needed |

---

## Override Protocol

If validator disagrees with suggestion:

```markdown
## Error Origin

| Field | Value |
|-------|-------|
| **SUGGESTED_ORIGIN** | FEATURE_PLAN (HIGH) |
| **FINAL_ORIGIN_LAYER** | IMPLEMENTATION |
| **OVERRIDE_REASON** | Plan is correct; code simply doesn't follow it |
| **EVIDENCE** | Plan says "use UTC", code uses local time incorrectly |
```

---

**Canonical Reference**: This file  
**Related**: `core/workflow/10_ERROR_TRACEABILITY.md`
