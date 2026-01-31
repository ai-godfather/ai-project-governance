# VALIDATOR_FIXATOR Workflow

> **Version**: 2.0.0  
> **Invocation**: `@workflow VALIDATOR` or `@workflow FIXATOR`  
> **Mode**: VALIDATOR=READ-ONLY, FIXATOR=WRITE (scoped)

---

## Overview

VALIDATOR performs first-pass validation of implementation. If issues found, FIXATOR resolves them. RE_VALIDATOR verifies fixes.

---

## Workflow Chain

```
@workflow VALIDATOR
        │
        ▼
┌─────────────────────────────────────┐
│ VALIDATOR: First-pass Validation    │
│                                     │
│ - Read plan                         │
│ - Check implementation              │
│ - Classify issues with ORIGIN_LAYER │
│ - Documentation Gate check (v2.0)   │
│ - Generate report                   │
└─────────────────────────────────────┘
        │
        ▼
   ┌────────────────┐
   │    VERDICT     │
   └────────────────┘
        │
   ┌────┴────┐
   ↓         ↓
 PASS      BLOCK
   │         │
   ↓         ↓
 Done    FIXATOR
            │
            ▼
┌─────────────────────────────────────┐
│ FIXATOR: Issue Remediation          │
│                                     │
│ - Read VALIDATOR report             │
│ - Verify ORIGIN_LAYER               │
│ - Fix IMPLEMENTATION issues only    │
│ - Run tests                         │
│ - Update changelog                  │
└─────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────┐
│ RE_VALIDATOR: Verify Fixes          │
│                                     │
│ - Compare original report           │
│ - Verify each fix                   │
│ - Check for regressions             │
│ - Generate verification report      │
└─────────────────────────────────────┘
            │
            ▼
   ┌────────────────┐
   │    VERDICT     │
   └────────────────┘
        │
   ┌────┴────┐
   ↓         ↓
 PASS     FAIL
   │         │
   ↓         ↓
 Done   Loop to FIXATOR
```

---

## VALIDATOR Workflow

```
@workflow VALIDATOR received
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: LOCATE ARTIFACTS            │
│ - Find feature plan                 │
│ - Find implementation               │
│ - Find TASK_INDEX                   │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: DOCUMENTATION GATE (v2.0)   │
│ 🔴 BLOCKING CHECKS:                 │
│                                     │
│ - Module docs exist? (FP-069)       │
│ - Changelog updated? (FP-069)       │
│ - All tasks completed? (FP-068)     │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: PLAN VS CODE COMPARISON     │
│ - Check each requirement            │
│ - Verify acceptance criteria        │
│ - Identify missing implementations  │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: CLASSIFY ISSUES             │
│ - Assign ORIGIN_LAYER               │
│ - Assign severity                   │
│ - Determine routing                 │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 5: WRITE REPORT                │
│ Path: .ai/_PLANS_VALIDATIONS/       │
│       {CODE}/VALIDATION_{date}.md   │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 6: VERDICT                     │
│ - PASS: No blockers                 │
│ - CONDITIONAL: Minor issues         │
│ - FAIL: Blockers found              │
└─────────────────────────────────────┘
```

---

## ORIGIN_LAYER Classification

| ORIGIN_LAYER | Description | Route To |
|--------------|-------------|----------|
| `FEATURE_PLAN` | Error in plan | PLANNER |
| `IMPLEMENTATION` | Code doesn't match plan | FIXATOR |
| `UI_PRESENTATION` | Display/UX error | FIXATOR |
| `DATA_MODEL` | Schema error | ARCHITECT |
| `EXTERNAL_DEPENDENCY` | Third-party issue | MONITOR |
| `DOCUMENTATION_DRIFT` | Docs don't match | CODE_DOCUMENTATOR |

---

## FIXATOR Workflow

```
@workflow FIXATOR received
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 1: READ VALIDATOR REPORT       │
│ - Parse issues                      │
│ - Check ORIGIN_LAYERs               │
│ - Verify no FEATURE_PLAN blockers   │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 2: VERIFY SCOPE                │
│ 🔴 FIXATOR REFUSES IF:              │
│ - ORIGIN_LAYER = FEATURE_PLAN       │
│   + Severity = BLOCKER              │
│ - Fix would expand scope            │
│ - Fix would change semantic intent  │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 3: FIX EACH ISSUE              │
│ - Minimal changes only              │
│ - Run tests after each fix          │
│ - Document fix in changelog         │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 4: UPDATE CHANGELOG            │
│ - List fixes applied                │
│ - Include test results              │
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│ STEP 5: REQUEST RE_VALIDATOR        │
│ Output: @workflow RE_VALIDATOR      │
└─────────────────────────────────────┘
```

---

## Documentation Gate Checks (v2.0)

| Check | Blocking? | Evidence |
|-------|-----------|----------|
| Module docs exist | 🔴 BLOCK | `docs/.../` file exists |
| Changelog updated | 🔴 BLOCK | `.ai/CHANGELOGS/` has entry |
| All tasks completed | 🔴 BLOCK | TASK_INDEX shows ✅ |
| TASK_INDEX status match | 🔴 BLOCK | Status matches code state |

---

## Forbidden Actions

### VALIDATOR
- ❌ Modify any code
- ❌ Skip ORIGIN_LAYER classification
- ❌ Pass with BLOCK conditions

### FIXATOR
- ❌ Expand scope
- ❌ Fix FEATURE_PLAN issues
- ❌ Change semantic intent
- ❌ Add new features

---

**Related Files**:
- `core/roles/VALIDATOR/README.md`
- `core/roles/FIXATOR/README.md`
- `core/roles/RE_VALIDATOR/README.md`
