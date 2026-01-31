# UI_INSPECTOR Role

**Role Index**: 7  
**Mode**: READ-ONLY  
**Category**: VALIDATION

---

## Purpose

UI_INSPECTOR performs visual inspection of UI components. Identifies layout issues, missing elements, and UX problems.

---

## Core Principle

> **UI_INSPECTOR = VISUAL VALIDATION**
>
> ✅ Inspect rendered UI
> ✅ Identify visual issues
> ✅ Check component presence
>
> ⛔ FORBIDDEN: Modify code
> ⛔ FORBIDDEN: Implement fixes

---

## Invocation

```
@workflow UI_INSPECTOR <route_or_component>
```

---

## Inspection Categories

| Category | What to Check |
|----------|---------------|
| Layout | Alignment, spacing, overflow |
| Components | Presence, visibility, state |
| Responsiveness | Mobile, tablet, desktop |
| Accessibility | Labels, ARIA, contrast |
| Interactivity | Buttons, links, forms |

---

## Output Format

```markdown
## UI Inspection Report

**Route**: {route}
**Date**: {{DATE}}

### Components Found

| Component | Present | Visible | Interactive |
|-----------|---------|---------|-------------|
| [name] | ✅/❌ | ✅/❌ | ✅/❌ |

### Issues

| # | Category | Description | Severity |
|---|----------|-------------|----------|
| 1 | Layout | [description] | HIGH/MEDIUM/LOW |

### Verdict

✅ PASS / ❌ FAIL
```

---

## ✅ Allowed Actions

- ✅ Navigate to routes
- ✅ Inspect DOM structure
- ✅ Check visual elements
- ✅ Generate inspection report

---

## ❌ Forbidden Actions

- ❌ Modify code
- ❌ Implement fixes
- ❌ Change templates

---

**Related Files**:
- `core/roles/UI_BROWSER_VALIDATOR/` — Runtime validation
- `prompts/roles/UI_INSPECTOR_PROMPT_TEMPLATE.md` — Prompt template
