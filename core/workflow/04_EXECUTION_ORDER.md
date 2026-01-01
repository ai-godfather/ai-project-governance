<!--
CORE GOVERNANCE COMPONENT — PROPRIETARY

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

This file is part of a proprietary governance framework.
NO LICENSE IS GRANTED for use, copying, or modification.
-->

# AI Workflow System - Execution Order

> Standard workflow sequences and execution rules.

---

## Standard Feature Flow

```
1. PLANNER          → Feature plan created
2. IMPLEMENTER      → Code written
3. VALIDATOR        → First-pass validation
4. UI_INSPECTOR     → Visual anomaly check
5. DATA_SEMANTIC    → Semantic integrity check
   _VALIDATOR
6. UI_BROWSER       → Runtime browser test
   _VALIDATOR
7. FIXATOR          → Fix issues (if any)
8. RE_VALIDATOR     → Verify fixes
```

---

## Execution Rules

| Rule | Description |
|------|-------------|
| **Sequential Validation** | VALIDATOR → UI_INSPECTOR → DATA_SEMANTIC → UI_BROWSER |
| **Any BLOCK = FIXATOR** | If any validation returns BLOCK, FIXATOR runs |
| **No Skip** | Cannot skip to RE_VALIDATOR if BLOCK exists |
| **Re-run After Fix** | UI_BROWSER_VALIDATOR should re-run if it issued BLOCK |
| **Origin Routing** | Issues routed by ORIGIN_LAYER (see below) |

---

## PLAN_ORIGINATED_BLOCK Rule (SUPREME)

This rule overrides "Any BLOCK = FIXATOR":

```
IF:
  - Any issue has ORIGIN_LAYER = FEATURE_PLAN
  - AND Severity ∈ {BLOCK, BLOCK_DEPLOYMENT}

THEN:
  - FIXATOR is FORBIDDEN ❌
  - PLANNER MUST be invoked
  - Feature Plan MUST be updated
  - Plan revision MUST be incremented
  - IMPLEMENTER MUST re-run from updated plan
  - Previous implementation is INVALID

VIOLATION = BLOCKER-level failure
```

### Error Origin Routing

| ORIGIN_LAYER | Severity | Next Step |
|--------------|----------|-----------|
| **FEATURE_PLAN** | BLOCK | PLANNER → IMPLEMENTER |
| IMPLEMENTATION | BLOCK | FIXATOR |
| UI_PRESENTATION | BLOCK | FIXATOR |
| **DATA_MODEL** | BLOCK | ARCHITECT |
| EXTERNAL_DEPENDENCY | Any | MONITOR_ONLY |

### Revised Flow with Origin Routing

```
VALIDATION COMPLETE
    │
    ├── All PASS? ──▶ RE_VALIDATOR (final) ──▶ DONE
    │
    └── Any BLOCK?
            │
            ▼
    CLASSIFY ORIGIN_LAYER
            │
            ├── FEATURE_PLAN ──▶ PLANNER ──▶ IMPLEMENTER ──▶ VALIDATION
            │                    (FIXATOR FORBIDDEN)
            │
            ├── IMPLEMENTATION ──▶ FIXATOR ──▶ RE_VALIDATOR
            │
            ├── UI_PRESENTATION ──▶ FIXATOR ──▶ RE_VALIDATOR
            │
            ├── DATA_MODEL ──▶ ARCHITECT ──▶ PLANNER ──▶ IMPLEMENTER
            │
            └── EXTERNAL_DEPENDENCY ──▶ MONITOR_ONLY
```

See: [10_ERROR_TRACEABILITY.md](10_ERROR_TRACEABILITY.md)

---

## Verdict Cascade

```
UI_INSPECTION.Verdict == BLOCK_DEPLOYMENT
    → VALIDATOR.Verdict = FAIL (mandatory)

DATA_SEMANTIC_VALIDATION.Verdict == BLOCK
    → VALIDATOR.Verdict = FAIL (mandatory)

UI_BROWSER_VALIDATION.Verdict == BLOCK
    → FIXATOR MUST RUN
    → RE_VALIDATOR MUST re-run browser validation
```

---

## Documentation Flow

After implementation is validated:

```
IMPLEMENTER (complete)
    │
    ▼
CODE_DOCUMENTATOR ──▶ docs/<MODULE>/
    │
    ▼
USER_DOCUMENTATOR CREATE ──▶ docs/_DASHBOARD_USER_GUIDE/
    │
    ▼
HELP_INTEGRATE --mode="empty" ──▶ UI Integration
```

---

## Documentation Governance Integration

### DOC_GUARD Position in Execution Flow

```
PLANNER → IMPLEMENTER → DOC_GUARD → VALIDATOR → [inspectors] → FIXATOR → RE_VALIDATOR
                           ↓
                    ADVISORY CHECKS
                           ↓
              ┌─────────────────────────────┐
              │ 🔴 HARD BLOCKER?            │
              │  - New job without docs     │
              │  - DANGEROUS op w/o docs    │
              └─────────────────────────────┘
                    ↓ YES           ↓ NO
              ┌─────────┐    ┌─────────────┐
              │ BLOCK   │    │ WARN/FLAG   │
              │ + trigger│    │ (continue)  │
              │ CODE_DOC │    └─────────────┘
              └─────────┘
```

### DOC_GUARD = ADVISORY (with 2 Hard Blockers)

| Detection | Type | Action |
|-----------|------|--------|
| New Cloud Run Job w/o docs | 🔴 HARD BLOCKER | BLOCK + trigger CODE_DOCUMENTATOR |
| DANGEROUS op w/o docs | 🔴 HARD BLOCKER | BLOCK + trigger CODE_DOCUMENTATOR |
| New route w/o MAPPINGS | ⚠️ Advisory | WARN (continue) |
| New service w/o BACKEND | 💡 Advisory | RECOMMEND (continue) |
| Stale documentation | 📋 Advisory | FLAG (continue) |

### Updated Execution Order

```
1. PLANNER (if new feature)
2. ARCHITECT (if ADR required)
3. IMPLEMENTER
4. DOC_GUARD
5. VALIDATOR
6. UI_INSPECTOR
7. DATA_SEMANTIC_VALIDATOR
8. UI_BROWSER_VALIDATOR
9. FIXATOR (if BLOCK)
10. RE_VALIDATOR
```

---

## Incident Flow

```
PRODUCTION INCIDENT
    │
    ▼
@workflow EMERGENCY_ERROR <SOURCE>
    │
    ├── CONTEXT FREEZE
    │
    ├── VALIDATOR (mandatory)
    │
    ├── CLASSIFY
    │       │
    │       ├── ACTIVE_BLOCKER ──▶ BLOCK
    │       │                         │
    │       │                         ▼
    │       │                    FIXATOR ──▶ RE_VALIDATOR
    │       │
    │       └── Others ──▶ NOT_BLOCK ──▶ Monitor/Close
    │
    └── REPORT
```

---

## Job Operations Flow

```
JOB ISSUE OBSERVED
    │
    ▼
@workflow JOB_OBSERVER <CONTEXT>
    │
    ├── COLLECT (logs, DB, schedulers)
    │
    ├── MATCH (vs _TROUBLESHOOTING_RULES.md)
    │       │
    │       ├── RULE FOUND ──▶ SAFE ACTIONS
    │       │
    │       └── NO RULE ──▶ ESCALATE
    │
    ├── DECIDE (SAFE / WAIT / BLOCKED / ESCALATE)
    │
    └── REPORT
```

---

## Validation Dependencies

| Source | Target | Condition |
|--------|--------|-----------|
| UI_INSPECTOR | VALIDATOR | VALIDATOR MUST read report |
| DATA_SEMANTIC | VALIDATOR | VALIDATOR MUST read report |
| UI_BROWSER | FIXATOR | If BLOCK → FIXATOR runs |
| Any Inspection | FIXATOR | Scope limited to reported issues |
| FIXATOR | RE_VALIDATOR | RE_VALIDATOR verifies output |
| ARCHITECT | IMPLEMENTER | No impl without ADR |

---

## Cheat Sheet

```
Feature Development:
PLAN → CODE → CHECK → VISUAL → SEMANTIC → BROWSER → FIX → VERIFY

Documentation:
CODE_DOC → USER_DOC → HELP_INTEGRATE

Incidents:
EMERGENCY → VALIDATE → CLASSIFY → VERDICT → [FIX] → [VERIFY]

Jobs:
OBSERVE → COLLECT → MATCH → DECIDE → REPORT
```

---

**Prev**: [03_ROLES.md](03_ROLES.md)  
**Next**: [05_FAILURE_PATTERNS.md](05_FAILURE_PATTERNS.md)
