# TDD_GUIDE FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure TDD_GUIDE outputs tests and reports correctly

---

## PRINCIPLE

```
TDD_GUIDE CREATES FAILING TESTS ONLY.
REPORT MUST BE SAVED TO FILE.
IMPLEMENTATION IS FORBIDDEN.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| Test Files | `{{TEST_DIR}}/{Feature}/*Test.{{EXT}}` | Test code |
| TDD Report | `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/TDD_GUIDE_REPORT_{date}.md` | Markdown |

---

## MANDATORY WORKFLOW

```
@workflow TDD_GUIDE received
        │
        ▼
1. RESOLVE task + locate feature plan
        │
        ▼
2. CHECK pre-flight conditions (API schema, interfaces)
   │
   ├─ MISSING API SCHEMA → ⛔ BLOCK, return to PLANNER
   │
   └─ SCHEMA EXISTS → Continue
        │
        ▼
3. ANALYZE existing patterns
   - Entity types
   - Controller patterns
   - Auth handling
        │
        ▼
4. CREATE test files (RED phase)
   - Tests MUST fail
   - Tests MUST match plan specification
        │
        ▼
5. RUN tests to confirm FAILURE
        │
        ▼
6. WRITE TDD report to file
        │
        ▼
7. OUTPUT handoff message to chat
```

---

## FILE PATH TEMPLATES

### Test Files

```
{{TEST_DIR}}/{Category}/{Feature}/{Name}Test.{{EXT}}

Examples (language-specific):
- tests/Feature/Dashboard/DashboardApiTest.php
- __tests__/features/dashboard/dashboard.test.ts
- tests/test_dashboard_api.py
```

### TDD Report

```
.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/TDD_GUIDE_REPORT_{YYYY-MM-DD}.md
```

---

## SCOPE LOCK

TDD_GUIDE can **ONLY** write to:

| Pattern | Allowed |
|---------|---------|
| `{{TEST_DIR}}/**/*` | ✅ YES |
| `{{SOURCE_DIR}}/**/*` | ❌ FORBIDDEN |
| `config/**/*` | ❌ FORBIDDEN |
| `migrations/**/*` | ❌ FORBIDDEN |

---

## ❌ FORBIDDEN

```
❌ Write implementation code (source files)
❌ Make tests pass
❌ Modify non-test files
❌ Skip pre-flight checks
❌ Create tests without API schema (if API feature)
❌ Display report in chat only without file save
```

---

## ✅ CORRECT WORKFLOW

```
✅ Check API schema exists in plan FIRST
✅ Analyze existing patterns BEFORE writing tests
✅ Create tests that FAIL on missing implementation
✅ Run tests to confirm failure
✅ Save report to file
✅ Output short handoff message
```

---

## CHAT OUTPUT FORMAT

After TDD phase completion:

```markdown
## 🔴 TDD_GUIDE COMPLETE — RED PHASE DONE

**Feature**: {FEATURE_CODE}
**Tests Created**: {count}
**Status**: 🔴 ALL FAILING (expected)

### Test Summary

| Test File | Tests | Status |
|-----------|-------|--------|
| `{{TEST_DIR}}/...` | 12 | 🔴 FAILING |

### Files Created

| File | Path | Status |
|------|------|--------|
| Tests | `{{TEST_DIR}}/...` | ✅ Created |
| TDD Report | `.ai/_PLANS_VALIDATIONS/{CODE}/TDD_GUIDE_REPORT_{date}.md` | ✅ Created |

### ⛔ HANDOFF TO IMPLEMENTER

Run: `@workflow IMPLEMENTER {FEATURE_CODE}`

Implementer must make these tests GREEN.
```

---

## VALIDATION CHECKLIST

Before completing TDD_GUIDE session:

- [ ] Pre-flight checks performed (API schema, interfaces)
- [ ] Test files created in correct location
- [ ] Tests actually FAIL when run
- [ ] TDD report saved to file
- [ ] Chat output includes handoff to IMPLEMENTER
- [ ] No implementation code written

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/TDD_GUIDE/README.md` — Role overview
