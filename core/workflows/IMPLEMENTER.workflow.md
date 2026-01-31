# IMPLEMENTER Workflow

> **Version**: 2.0.0  
> **Invocation**: `@workflow IMPLEMENTER <FEATURE_CODE>`  
> **Mode**: WRITE (scoped to plan)

---

## Overview

IMPLEMENTER is the **ONLY role** authorized to implement features. Executes plans VERBATIM — without reinterpretation, without scope expansion.

**🔴 CRITICAL v2.0**: IMPLEMENTER must run TDD CHECK before implementation if tests exist.

---

## Workflow Steps

```
@workflow IMPLEMENTER <FEATURE_CODE> received
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: VERIFY PREREQUISITES        │
│ - Plan exists                       │
│ - AUDITOR passed                    │
│ - No blocking conditions            │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: READ PLAN AND TASKS         │
│ - Parse feature plan                │
│ - List all tasks                    │
│ - Identify dependencies             │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: TDD CHECK (v2.0)            │
│ 🔴 CRITICAL: Before implementation! │
│                                     │
│ Check for TDD_GUIDE report:         │
│ .ai/_PLANS_VALIDATIONS/{CODE}/      │
│ TDD_GUIDE_REPORT_*.md               │
│                                     │
│ If exists:                          │
│   - Run tests: {{TEST_COMMAND}}     │
│   - Verify tests FAIL (RED phase)   │
│   - Proceed to make tests PASS      │
│                                     │
│ If not exists:                      │
│   - Note in changelog               │
│   - Proceed with implementation     │
└─────────────────────────────────────┘
        │
        ▼
   ┌────────────┐
   │   LOOP     │◄──── For each task
   │  PER TASK  │
   └────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: READ TASK                   │
│ - Parse task file                   │
│ - Understand requirements           │
│ - Check dependencies complete       │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 5: VERIFY SERVICE INTERFACE    │
│ (FP-057)                            │
│                                     │
│ Before calling service methods:     │
│ - Verify method signature exists    │
│ - Match parameters to actual API    │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 6: IMPLEMENT                   │
│ - Write code                        │
│ - Follow plan requirements          │
│ - Add graceful degradation (FP-058) │
│ - NO scope expansion                │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 7: RUN TESTS                   │
│ - Unit tests                        │
│ - If TDD: verify tests PASS         │
│ - E2E tests (if endpoint/UI)        │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 8: RUN HOOKS                   │
│ - Linter: {{LINTER_COMMAND}}        │
│ - Config lint (if applicable)       │
│ - Fix any issues                    │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 9: UPDATE TASK STATUS          │
│ 🔴 IMMEDIATELY! (FP-068)            │
│                                     │
│ - Task file: status = completed     │
│ - TASK_INDEX.md: ✅ completed       │
│ - NO batching at end of session!    │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 10: UPDATE CHANGELOG           │
│ - Add entry for task                │
│ - Include hook compliance           │
│ - Note any issues                   │
└─────────────────────────────────────┘
        │
        ▼
   [Next task or complete]
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 11: FINAL VERIFICATION         │
│ - All tasks completed               │
│ - TASK_INDEX fully updated          │
│ - Changelog current                 │
│ - Recommend: @workflow VALIDATOR    │
└─────────────────────────────────────┘
```

---

## TDD CHECK Detail

```
TDD CHECK FLOW:

1. Look for TDD_GUIDE report
   ↓
   ├── Report EXISTS
   │   ↓
   │   a. Find test files
   │   b. Run tests: {{TEST_COMMAND}}
   │   c. Verify tests FAIL (expected)
   │   d. Implement to make tests PASS
   │   e. Run tests again: confirm GREEN
   │
   └── Report NOT EXISTS
       ↓
       a. Note: "No TDD tests found"
       b. Proceed with implementation
       c. Consider writing tests after
```

---

## Task Execution Flow

```
For each task:

1. READ task file
2. CHECK dependencies complete
3. VERIFY service interface (FP-057)
4. IMPLEMENT code
5. ADD graceful degradation (FP-058)
6. RUN tests
7. RUN hooks (linter)
8. UPDATE task status → completed (IMMEDIATELY)
9. UPDATE TASK_INDEX.md (IMMEDIATELY)
10. UPDATE changelog
11. PROCEED to next task
```

---

## Output Requirements

| Output | Location | When |
|--------|----------|------|
| Code files | `{{SOURCE_DIR}}/` | During implementation |
| Changelog | `.ai/CHANGELOGS/{{DATE}}.snapshot.md` | After each task |
| Task status | Task file | After each task |
| Task index | `TASK_INDEX.md` | After each task |

---

## Hook Compliance Declaration

Include in changelog:

```markdown
## Hook Compliance Declaration

| Hook | Applied? | Result |
|------|----------|--------|
| Linter | ✅ YES / ❌ NO | [result] |
| Tests | ✅ YES / ❌ NO | [result] |
```

---

## Forbidden Actions

- ❌ Implement without reading plan first
- ❌ Implement without AUDITOR pass
- ❌ Reinterpret or "improve" plan
- ❌ Expand scope beyond plan
- ❌ Skip hook compliance
- ❌ **Proceed to next task without updating status (FP-056/068)**
- ❌ **Skip TDD test run if TDD_GUIDE report exists**
- ❌ **Call service method without verifying signature (FP-057)**

---

## Refusal Conditions

IMPLEMENTER MUST refuse if:

1. Plan does not exist
2. AUDITOR did not pass
3. Plan has ambiguous requirements
4. Previous blocking tasks not complete
5. ADR required but missing

---

**Related Files**:
- `core/roles/IMPLEMENTER/README.md` — Role overview
