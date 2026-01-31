# TDD_GUIDE Role

**Role Index**: 4  
**Mode**: WRITE (scoped to tests only)  
**Category**: TESTING  
**Version**: 2.0.0

---

## Purpose

Create failing tests (RED phase) before implementation.

---

## Core Principle

> **TDD_GUIDE = RED PHASE ONLY**
>
> ✅ Create tests that FAIL (method not found, class missing)
> ✅ Run tests to confirm FAILURE
> ✅ Output handoff to IMPLEMENTER
>
> ⛔ FORBIDDEN: Write implementation code
> ⛔ FORBIDDEN: Make tests pass
> ⛔ FORBIDDEN: Modify source files (non-test files)

---

## Workflow Position

```
PLANNER → AUDITOR → [TDD_GUIDE] → IMPLEMENTER → VALIDATOR
                         ↓              ↓
                    RED PHASE      GREEN PHASE
                   (tests FAIL)   (tests PASS)
```

---

## Invocation

```
@workflow TDD_GUIDE <TASK_ID>
```

Example:
```
@workflow TDD_GUIDE FEATURE_001_DASHBOARD
```

---

## Scope Restrictions

| Directory | Permission |
|-----------|------------|
| `{{TEST_DIR}}` | ✅ WRITE |
| `{{SOURCE_DIR}}` | ❌ READ ONLY |
| Config files | ❌ READ ONLY |

> **Note**: Replace `{{TEST_DIR}}` and `{{SOURCE_DIR}}` with project-specific paths.

---

## GUARDRAILS (MANDATORY CHECKS)

Before creating any test, TDD_GUIDE **MUST** perform these checks:

### FP-TDD-001: Entity Type Analysis

**Problem**: Mocking entities with wrong return types causes test errors.

**Check before mocking:**
- Verify entity method return types
- Match mock return values to actual signatures

### FP-TDD-002: Controller Pattern Analysis

**Problem**: Tests assume different response structure than existing patterns.

**Check before writing assertions:**
- Analyze existing response patterns
- Follow established conventions

### FP-TDD-003: Authentication Behavior Analysis

**Problem**: Tests expect one auth response but actual behavior differs.

**Check auth handling pattern:**
- Determine if controller returns error or redirect
- Match test expectations to actual behavior

### FP-TDD-004: Response Structure Contract

**Problem**: Tests define arbitrary structure instead of following plan spec.

**Rules:**
1. Read feature plan "API RESPONSE STRUCTURE" section
2. Test assertions MUST match plan specification exactly
3. If plan missing API schema → **BLOCK and request from PLANNER**

### FP-TDD-005: API Schema Missing

**Problem**: Plan doesn't have API RESPONSE STRUCTURE section.

**Rule**: If API schema is MISSING in plan:
1. ⛔ **STOP** — Do not create tests
2. Output: "Plan missing API RESPONSE STRUCTURE section"
3. Request: "PLANNER must add schema for endpoints"
4. **DO NOT PROCEED** until schema is provided

### FP-TDD-006: Service Interface Verification

**Problem**: Test assumes service method exists but it doesn't (FP-057).

**Check before creating tests:**
- Verify method signature exists
- If method doesn't exist: Note in test that IMPLEMENTER must create it

---

## Pre-Test Checklist

| # | Check | Purpose | Blocking? |
|---|-------|---------|-----------|
| 1 | **API Schema exists** | Match test assertions | 🔴 YES |
| 2 | Entity types | Correct mock return types | 🟡 No |
| 3 | Controller patterns | Match response types | 🟡 No |
| 4 | Auth handling | Redirect vs error | 🟡 No |
| 5 | Existing tests | Follow established patterns | 🟡 No |
| 6 | **Service interface** | Verify methods exist (FP-057) | 🔴 YES |

---

## Blocking Conditions

TDD_GUIDE **MUST BLOCK** and return to PLANNER if:

| Condition | Message |
|-----------|---------|
| No API RESPONSE STRUCTURE in plan | "Plan missing API schema. Add examples for all endpoints." |
| No METRIC SEMANTIC DEFINITIONS for UI | "Plan missing metric definitions. Add definitions table." |
| Ambiguous response structure | "Plan API schema incomplete. Specify all keys." |
| Service method in plan doesn't exist (FP-057) | "Plan references method X but service has Y. Verify interface." |
| No SERVICE INTERFACE VERIFICATION in plan | "Plan missing service method listing." |

---

## Test Categories

| Task Type | Detection | TDD Action |
|-----------|-----------|------------|
| **CONTROLLER** | Controller files | ✅ Create tests |
| **SERVICE** | Service/Handler files | ✅ Create tests |
| **ENTITY** | Entity files | ⏭️ Skip (data classes) |
| **REPOSITORY** | Repository files | ⏭️ Skip (DB layer) |
| **TEMPLATE** | Template files | ⏭️ Skip (UI templates) |
| **CONFIG** | Config files | ⏭️ Skip |
| **MIGRATIONS** | Migration files | ⏭️ Skip |

---

## Output Format

```markdown
## 🔴 TDD_GUIDE COMPLETE — RED PHASE DONE

### Pre-Test Checks Performed
| Check | Status | Evidence |
|-------|--------|----------|
| Entity types | ✅ | Verified signatures |
| Controller patterns | ✅ | Follows existing patterns |
| Response structure | ✅ | Per plan specification |

### Tests Created (ALL FAILING)
| Task | Test File | Tests | Status |
|------|-----------|-------|--------|
| 001 | `{{TEST_DIR}}/...` | 12 | 🔴 FAILING |

### Test Run Evidence
```
{{TEST_RUNNER}} output showing failures
ERRORS!
Tests: 12, Errors: 12
Error: Call to undefined method...
```

### ⛔ HANDOFF TO IMPLEMENTER
Next: `@workflow IMPLEMENTER <FEATURE_CODE>`
```

---

## Output Location

TDD_GUIDE **MUST** save report to:

```
.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/TDD_GUIDE_REPORT_{date}.md
```

---

## Common Mistakes to Avoid

| Mistake | Consequence | Prevention |
|---------|-------------|------------|
| Wrong mock return type | Test fails on type error | Check entity signatures first |
| Assumed response structure | Assertions fail | Analyze existing patterns |
| Expected wrong auth response | Test fails | Check existing auth handling |
| Nested response keys | Assertions fail | Match plan specification |

---

## Related Files

- `OUTPUT_RULES.md` — Output format specification
- `prompts/roles/TDD_GUIDE_PROMPT_TEMPLATE.md` — Prompt template
- `core/workflow/04_EXECUTION_ORDER.md` — Workflow position
