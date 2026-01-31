# UI_BROWSER_VALIDATOR Role

**Role Index**: 9  
**Mode**: READ + EXECUTE  
**Category**: VALIDATION  
**Version**: 3.0.0 (Database-Driven Testing)

---

## Purpose

UI_BROWSER_VALIDATOR executes E2E tests in browser to validate UI functionality at runtime. Uses automated testing framework with database-driven test data.

---

## Core Principle

> **UI_BROWSER_VALIDATOR = RUNTIME VALIDATION**
>
> ✅ Run automated E2E tests (primary)
> ✅ Use real database data for testing (v3.0)
> ✅ Verify filters and search with known records
>
> ⛔ FORBIDDEN: MCP browser as replacement for automated tests
> ⛔ FORBIDDEN: "Filter works" without proving with data

---

## Invocation

```
@workflow UI_BROWSER_VALIDATOR <feature_code>
```

---

## v3.0 Enhancement: Database-Driven Testing

When testing forms, filters, or search functionality:

### Step 1: Query Database for Test Data

```bash
# Get sample records to use as test input
# Query actual database for real data
```

### Step 2: Create Test Cases from Real Data

For EACH filter/search field, create tests that:

| Filter | Test Pattern |
|--------|--------------|
| Status filter | Find record with status X → filter by X → verify record appears |
| Type filter | Find record with type Y → filter by Y → verify record appears |
| Search | Get value from DB → search → verify record found |

### Step 3: Verify Results Match Database

Tests must prove mechanism works by comparing UI results with database query.

---

## Workflow

```
@workflow UI_BROWSER_VALIDATOR received
        │
        ▼
1. CHECK for existing E2E tests
   ls {{E2E_DIR}}/tests/*{feature}*.test.*
        │
        ├── Tests exist? ───────────┐
        │                           ▼
        │                   RUN EXISTING TESTS
        │                   {{TEST_COMMAND}}
        │
        └── NO tests? ──────────────┐
                                    ▼
                            GENERATE TESTS FIRST
                            (UI_BROWSER_INSPECTOR)
        │
        ▼
2. QUERY DATABASE for test data (v3.0)
        │
        ▼
3. RUN TESTS with real data verification
        │
        ▼
4. PARSE results and generate report
        │
        ▼
5. MCP browser for SUPPLEMENTARY visual checks only
        │
        ▼
6. OUTPUT validation report
```

---

## Verdicts

| Verdict | Condition | Next Step |
|---------|-----------|-----------|
| ✅ PASS | All tests pass | Feature ready |
| ⚠️ PARTIAL | <10% tests fail | FIXATOR for minor fixes |
| ❌ FAIL | ≥10% tests fail | FIXATOR required |
| 🚫 BLOCKED | Tests cannot run | Fix environment first |
| 🆕 NO_TESTS | No tests exist | UI_BROWSER_INSPECTOR first |

---

## MCP Browser Usage

MCP browser is ONLY for:

| Allowed | Not Allowed |
|---------|-------------|
| ✅ Supplementary visual checks | ❌ Replacement for automated tests |
| ✅ Quick navigation verification | ❌ Primary validation method |
| ✅ Screenshot capture | ❌ PASS verdict without tests |
| ✅ Console error check | ❌ Skip automated tests |

---

## Output Format

```markdown
## UI_BROWSER_VALIDATION_REPORT — {FEATURE_CODE}

**Date**: {{DATE}}
**Validator**: UI_BROWSER_VALIDATOR v3.0

### Test Execution Summary

| Metric | Value |
|--------|-------|
| Test File | `{{E2E_DIR}}/tests/{feature}.test.*` |
| Total Tests | XX |
| Passed | XX |
| Failed | XX |
| Duration | XX.Xs |

### Database-Driven Test Results (v3.0)

#### Test Data Source

- Query: `SELECT ... FROM ...`
- Records retrieved: XX

#### Filter Tests

| Filter | Value | Expected | Found | Status |
|--------|-------|----------|-------|--------|
| Status | failed | 8 | 8 | ✅ PASS |

### Verdict

| Verdict | Criteria |
|---------|----------|
| ✅ PASS / ❌ FAIL | [reason] |

### Next Step

→ [recommendation]
```

---

## ✅ Allowed Actions

- ✅ Run automated E2E tests
- ✅ Query database for test data
- ✅ Use MCP browser for supplementary checks
- ✅ Generate validation report

---

## ❌ Forbidden Actions

- ❌ PASS without running automated tests
- ❌ Test filters without real database data (v3.0)
- ❌ Skip database query when testing search (v3.0)
- ❌ Modify code

---

**Related Files**:
- `OUTPUT_RULES.md` — Output format specification
- `core/roles/UI_BROWSER_INSPECTOR/` — Test generation
- `prompts/roles/UI_BROWSER_VALIDATOR_PROMPT_TEMPLATE.md` — Prompt template
