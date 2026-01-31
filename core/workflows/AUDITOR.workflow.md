# AUDITOR Workflow

> **Version**: 2.0.0  
> **Invocation**: `@workflow AUDITOR <FEATURE_CODE>`  
> **Mode**: READ-ONLY / STRICT

---

## Overview

AUDITOR is the **quality gate** between PLANNER and IMPLEMENTER. It verifies that generated tasks are a faithful projection of the feature plan.

---

## Workflow Steps

```
@workflow AUDITOR <FEATURE_CODE> received
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: LOCATE ARTIFACTS            │
│ - Find plan: .ai/plans/features/... │
│ - Find tasks: .ai/tasks/.../        │
│ - Verify feature code matches       │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: READ PLAN                   │
│ - Parse scope (IN/OUT)              │
│ - Parse task summary table          │
│ - Identify phases                   │
│ - Extract acceptance criteria       │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: READ ALL TASK FILES         │
│ - Count task files                  │
│ - Parse each task content           │
│ - Build task inventory              │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: EXECUTE 15-DIMENSION AUDIT  │
│                                     │
│ 1. Coverage Completeness            │
│ 2. Phase Alignment                  │
│ 3. Task Granularity                 │
│ 4. Forbidden Additions              │
│ 5. Guardrails Fidelity              │
│ 6. Test Coverage                    │
│ 7. API Schema Presence (FP-054)     │
│ 8. Metric Definitions (FP-050/051)  │
│ 9. Task Count Verification (FP-055) │
│10. Service Interface (FP-057)       │
│11. Graceful Degradation (FP-058)    │
│12. Dependency Declaration (FP-059)  │
│13. ASCII Mockup Coverage (FP-060)   │
│14. Mockup Line References (FP-060)  │
│15. Long Prompt Scan (FP-061)        │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 5: BUILD COVERAGE MATRIX       │
│ - Plan element → Task mapping       │
│ - Identify gaps                     │
│ - Identify additions                │
│ - Calculate coverage percentage     │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 6: DETERMINE VERDICT           │
│                                     │
│ ✅ PASS: 100% coverage, no issues   │
│ ⚠️ PARTIAL: <10% gaps, minor issues │
│ ❌ FAIL: >10% gaps or blockers      │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 7: WRITE REPORT TO FILE        │
│ 🔴 CRITICAL: Save to file!          │
│ Path: .ai/_PLANS_VALIDATIONS/       │
│       {CODE}/PLANNER_AUDIT_{date}.md│
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 8: OUTPUT CONFIRMATION         │
│ - Short summary in chat             │
│ - Verdict                           │
│ - Coverage percentage               │
│ - Next step recommendation          │
└─────────────────────────────────────┘
```

---

## Audit Dimensions Detail

### 1. Coverage Completeness
Every plan element has corresponding task(s).

### 2. Phase Alignment
Tasks are in correct phases, no boundary violations.

### 3. Task Granularity
Tasks are concrete, testable, map to artifacts.

### 4. Forbidden Additions
No scope creep, no invented requirements.

### 5. Guardrails Fidelity
Constraints explicitly enforced.

### 6. Test Coverage
Each phase has testing tasks where appropriate.

### 7. API Schema Presence (FP-054)
Plan has API RESPONSE STRUCTURE for endpoints.

### 8. Metric Definitions Presence (FP-050/051)
Plan has METRIC SEMANTIC DEFINITIONS for UI.

### 9. Task Count Verification (FP-055)
Generated task files = planned task count.

### 10. Service Interface Listing (FP-057)
Plan lists actual service method signatures.

### 11. Graceful Degradation (FP-058)
Plan specifies fallback for cross-module queries.

### 12. Dependency Declaration (FP-059)
Plan marks which modules are from other features.

### 13. ASCII Mockup Coverage (FP-060)
All mockups from prompt mapped to tasks.

### 14. Mockup Line References (FP-060)
UI tasks reference source mockup line numbers.

### 15. Long Prompt Section Scan (FP-061)
All sections of prompts >300 lines verified.

---

## Output Requirements

| Output | Location | Tool |
|--------|----------|------|
| Audit Report | `.ai/_PLANS_VALIDATIONS/{CODE}/PLANNER_AUDIT_{date}.md` | Write |
| Confirmation | Chat | Message |

---

## Report Structure

```markdown
# Audit Report: {FEATURE_CODE}

**Date**: {{DATE}}
**Auditor**: @workflow AUDITOR

---

## Executive Summary

**Verdict**: ✅ PASS / ⚠️ PARTIAL / ❌ FAIL

---

## Coverage Matrix

| Plan Element | Task(s) | Status |
|--------------|---------|--------|
| [element] | [task IDs] | ✅/❌ |

**Coverage**: X/Y (Z%)

---

## Dimension Results

| # | Dimension | Status | Notes |
|---|-----------|--------|-------|
| 1 | Coverage Completeness | ✅/❌ | ... |
| ... | ... | ... | ... |

---

## Critical Findings

[List of blocking issues]

---

## Recommendations

[Next steps based on verdict]
```

---

## Verdicts

| Verdict | Criteria | Next Step |
|---------|----------|-----------|
| ✅ PASS | 100% coverage, no blockers | IMPLEMENTER proceeds |
| ⚠️ PARTIAL | <10% gaps, minor issues | PLANNER fixes → re-audit |
| ❌ FAIL | >10% gaps or blockers | PLANNER regenerates tasks |

---

## Forbidden Actions

- ❌ Modify feature plan
- ❌ Modify task files
- ❌ Create new tasks
- ❌ Implement code
- ❌ Display report in chat only (must save to file)
- ❌ Pass audit with blocking issues

---

**Related Files**:
- `core/roles/AUDITOR/README.md` — Role overview
- `core/roles/AUDITOR/OUTPUT_RULES.md` — Output enforcement
