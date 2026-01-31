# UI_BROWSER_VALIDATOR FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure UI_BROWSER_VALIDATOR runs actual tests, not just visual checks  
> **Version**: 3.0.0 (Database-Driven Testing)

---

## PRINCIPLE

```
AUTOMATED TESTS ARE PRIMARY.
MCP BROWSER IS SUPPLEMENTARY ONLY.
DATABASE DATA IS REQUIRED FOR FILTER/SEARCH TESTS.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| Validation Report | `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/UI_VALIDATION_{date}.md` | Markdown |

---

## MANDATORY WORKFLOW

```
@workflow UI_BROWSER_VALIDATOR received
        │
        ▼
1. CHECK for existing E2E tests
        │
        ├── Tests exist → RUN THEM (PRIMARY)
        │
        └── No tests → REQUEST UI_BROWSER_INSPECTOR
        │
        ▼
2. QUERY DATABASE for test data (v3.0)
        │
        ▼
3. RUN TESTS with verification
        │
        ▼
4. PARSE results
        │
        ▼
5. MCP browser for SUPPLEMENTARY checks ONLY
        │
        ▼
6. SAVE report to file
        │
        ▼
7. OUTPUT confirmation to chat
```

---

## DATABASE TESTING REQUIREMENTS (v3.0)

When UI contains forms, filters, or search:

### MUST DO

| Requirement | Why |
|-------------|-----|
| Query DB for sample records | Need real data to test with |
| Test each filter with known data | Prove filter finds correct records |
| Test search with known values | Prove search returns expected result |
| Compare UI results with DB query | Prove mechanism actually works |

### MUST NOT

| Forbidden | Why |
|-----------|-----|
| Test with made-up data | Can't prove mechanism works |
| "Filter loads" without data test | Visual test ≠ functional test |
| Assume search works | Must prove with real record |

---

## ❌ FORBIDDEN

```
❌ PASS without running automated tests
❌ Only use MCP browser without test execution
❌ Skip database query for filter/search tests (v3.0)
❌ "Filter works" without proving it finds correct records (v3.0)
```

---

## ✅ CORRECT WORKFLOW

```
✅ Run automated tests FIRST (primary)
✅ Query database for test data (v3.0)
✅ Verify filters/search with known records (v3.0)
✅ Use MCP browser for supplementary checks only
✅ Save report to file
✅ Output short confirmation
```

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/UI_BROWSER_VALIDATOR/README.md` — Role overview
