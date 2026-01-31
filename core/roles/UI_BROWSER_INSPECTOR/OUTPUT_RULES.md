# UI_BROWSER_INSPECTOR FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure UI_BROWSER_INSPECTOR generates comprehensive E2E tests

---

## PRINCIPLE

```
UI_BROWSER_INSPECTOR GENERATES E2E TESTS.
ALL TEST CATEGORIES MUST BE COVERED.
TESTS MUST BE SAVED TO FILES.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| E2E Tests | `{{E2E_DIR}}/tests/{feature}*.test.{{EXT}}` | JS/TS |
| Inspection Report | `.ai/_PLANS_VALIDATIONS/{CODE}/UI_INSPECTION_{date}.md` | Markdown |

---

## MANDATORY WORKFLOW

```
@workflow UI_BROWSER_INSPECTOR received
        │
        ▼
1. IDENTIFY target URL from feature
        │
        ▼
2. NAVIGATE browser to page
        │
        ▼
3. ANALYZE structure
   - Forms, inputs, buttons
   - Tabs, modals
   - Network requests
        │
        ▼
4. DETECT applicable test categories
        │
        ▼
5. GENERATE test files for each category
        │
        ▼
6. SAVE tests to {{E2E_DIR}}
        │
        ▼
7. SAVE inspection report
        │
        ▼
8. OUTPUT confirmation to chat
```

---

## FILE PATH TEMPLATES

### E2E Test Files

```
{{E2E_DIR}}/tests/{feature-name}.test.{{EXT}}
{{E2E_DIR}}/tests/{feature-name}-ui.test.{{EXT}}
{{E2E_DIR}}/tests/{feature-name}-api.test.{{EXT}}
{{E2E_DIR}}/tests/{feature-name}-defaults.test.{{EXT}}
```

### Inspection Report

```
.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/UI_INSPECTION_{YYYY-MM-DD}.md
```

---

## TEST CATEGORY REQUIREMENTS

For each applicable category, generate tests:

| Category | Required Tests |
|----------|----------------|
| **Forms** | Validation, submission, defaults, errors |
| **Tabs** | Navigation, content loading, state |
| **Modals** | Open, close, actions, cancel |
| **API** | Success responses, error handling, loading |
| **State** | Save, restore, clear, persistence |
| **Defaults** | Initial values, pre-filled fields |
| **Navigation** | Links, redirects, breadcrumbs |

---

## ❌ FORBIDDEN

```
❌ Skip applicable test categories
❌ Display tests in chat only
❌ Modify source/template files
❌ Implement features
❌ Run tests (that's UI_BROWSER_VALIDATOR)
```

---

## ✅ CORRECT WORKFLOW

```
✅ Navigate to actual page
✅ Analyze all interactive elements
✅ Generate tests for ALL applicable categories
✅ Save tests to file system
✅ Save inspection report
✅ Output short confirmation
```

---

## VALIDATION CHECKLIST

Before completing UI_BROWSER_INSPECTOR session:

- [ ] Page successfully navigated
- [ ] All interactive elements identified
- [ ] All applicable test categories covered
- [ ] Test files saved to `{{E2E_DIR}}`
- [ ] Inspection report saved
- [ ] Chat output includes next step

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/UI_BROWSER_INSPECTOR/README.md` — Role overview
