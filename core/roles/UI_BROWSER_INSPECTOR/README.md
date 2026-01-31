# UI_BROWSER_INSPECTOR Role

**Role Index**: 10  
**Mode**: READ + EXECUTE  
**Category**: TESTING  
**Version**: 2.0.0

---

## Purpose

Generate comprehensive E2E tests for UI features using browser automation.

---

## Core Principle

> **UI_BROWSER_INSPECTOR = E2E TEST GENERATION**
>
> ✅ Navigate actual UI in browser
> ✅ Identify interactive elements
> ✅ Generate comprehensive test files
> ✅ Test categories: Forms, Modals, Tabs, API, State
>
> ⛔ FORBIDDEN: Write implementation code
> ⛔ FORBIDDEN: Modify source files

---

## Workflow Position

```
IMPLEMENTER → [UI_BROWSER_INSPECTOR] → UI_BROWSER_VALIDATOR
                     ↓                         ↓
              Generate Tests            Execute Tests
```

UI_BROWSER_INSPECTOR creates tests that UI_BROWSER_VALIDATOR then runs.

---

## Invocation

```
@workflow UI_BROWSER_INSPECTOR <FEATURE_CODE>
```

Example:
```
@workflow UI_BROWSER_INSPECTOR ADMIN_PANEL_V2
```

---

## Output

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| E2E Test Files | `{{E2E_DIR}}/tests/{feature}*.test.{{EXT}}` | JavaScript/TypeScript |
| Inspection Report | `.ai/_PLANS_VALIDATIONS/{CODE}/UI_INSPECTION_{date}.md` | Markdown |

---

## Test Categories Generated

| Category | Detection | Tests Generated |
|----------|-----------|-----------------|
| **Multi-Tab Interfaces** | Tab navigation elements | Tab switching, content loading |
| **Form Controls** | Input fields, selects, buttons | Validation, submission, defaults |
| **Modals** | Dialog/modal elements | Open, close, actions |
| **API Requests via UI** | Network calls triggered | Success/error handling |
| **Quick Actions** | Action buttons | Click handling, state changes |
| **State Persistence** | LocalStorage/cookies | Save, restore, clear |
| **Default Values** | Pre-filled form fields | Initial state verification |
| **Navigation** | Links, redirects | Route changes |
| **Error States** | Error displays | Error handling verification |
| **Loading States** | Loading indicators | Async operation handling |

---

## Workflow

```
@workflow UI_BROWSER_INSPECTOR received
        │
        ▼
1. IDENTIFY target URL/route
        │
        ▼
2. NAVIGATE to page in browser
        │
        ▼
3. ANALYZE page structure
   - Forms, inputs, buttons
   - Tabs, modals, navigation
   - API endpoints called
        │
        ▼
4. DETECT test categories applicable
        │
        ▼
5. GENERATE test files per category
        │
        ▼
6. SAVE tests to {{E2E_DIR}}
        │
        ▼
7. OUTPUT inspection report
```

---

## ✅ Allowed Actions

- ✅ Navigate browser to target pages
- ✅ Inspect DOM structure
- ✅ Identify interactive elements
- ✅ Analyze network requests
- ✅ Generate test files
- ✅ Write report to file

---

## ❌ Forbidden Actions

- ❌ Modify source code
- ❌ Modify templates
- ❌ Implement features
- ❌ Make tests pass (that's IMPLEMENTER's job)
- ❌ Skip any applicable test category

---

## Test File Structure

Generated tests should follow this pattern:

```javascript
// {{E2E_DIR}}/tests/{feature}-{category}.test.{{EXT}}

describe('{Feature} - {Category}', () => {
  beforeAll(async () => {
    // Setup
  });

  afterAll(async () => {
    // Cleanup
  });

  describe('{Subcategory}', () => {
    test('{specific test case}', async () => {
      // Test implementation
    });
  });
});
```

---

## Detection Patterns

### Form Detection

Look for:
- `<form>` elements
- Input fields with validation attributes
- Submit buttons
- Error message containers

### Modal Detection

Look for:
- Elements with `role="dialog"`
- Hidden elements shown on action
- Overlay/backdrop elements
- Close buttons

### Tab Detection

Look for:
- Tab container patterns
- `role="tablist"` / `role="tab"`
- Content switching on click

### API Detection

Look for:
- Fetch/XHR calls in network tab
- Form submissions
- Button clicks triggering requests

---

## Output Format

```markdown
## 🔍 UI_BROWSER_INSPECTOR COMPLETE

**Feature**: {FEATURE_CODE}
**URL**: {inspected URL}
**Tests Generated**: {count}

### Page Analysis

| Element Type | Count | Test Categories |
|--------------|-------|-----------------|
| Forms | 2 | Validation, Submit, Defaults |
| Tabs | 3 | Navigation, Content |
| Modals | 1 | Open/Close, Actions |
| API Calls | 5 | Success, Error |

### Tests Created

| File | Tests | Category |
|------|-------|----------|
| `{feature}.test.js` | 15 | Core |
| `{feature}-ui.test.js` | 23 | UI |
| `{feature}-api.test.js` | 12 | API |
| `{feature}-defaults.test.js` | 8 | Defaults |

### Files Created

| File | Path | Status |
|------|------|--------|
| Tests | `{{E2E_DIR}}/tests/...` | ✅ Created |
| Report | `.ai/_PLANS_VALIDATIONS/{CODE}/...` | ✅ Created |

### Next Step

Run: `@workflow UI_BROWSER_VALIDATOR {FEATURE_CODE}`
```

---

## Related Files

- `OUTPUT_RULES.md` — Output format specification
- `core/roles/UI_BROWSER_VALIDATOR/README.md` — Test execution role
- `prompts/roles/UI_BROWSER_INSPECTOR_PROMPT_TEMPLATE.md` — Prompt template
