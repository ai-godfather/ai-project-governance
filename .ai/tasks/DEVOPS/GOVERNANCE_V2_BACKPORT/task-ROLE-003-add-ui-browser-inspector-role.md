# Task: ROLE-003 — Add UI_BROWSER_INSPECTOR Role

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the UI_BROWSER_INSPECTOR role for generating comprehensive E2E tests using browser automation (Puppeteer/Playwright).

---

## Input Requirements

- Read callrelay source: `.ai/roles/UI_BROWSER_INSPECTOR/README.md`
- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (UI_BROWSER_INSPECTOR section)
- Read callrelay workflow: `.ai/workflows/UI_BROWSER_INSPECTOR.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/roles/UI_BROWSER_INSPECTOR/README.md` — Full role documentation

### Content Requirements

The UI_BROWSER_INSPECTOR README.md must include:

1. **Purpose**: Generate comprehensive E2E tests using browser automation
2. **Mode**: READ + EXECUTE
3. **Command**: `@workflow UI_BROWSER_INSPECTOR <FEATURE_CODE>`
4. **Output Location**: `e2e-tests/tests/{feature}-*.test.js`
5. **Tooling**: Puppeteer/Playwright (parameterized)
6. **Test Categories**:
   - Multi-Tab Interfaces
   - Form Controls
   - API Requests via UI
   - Quick Actions
   - Modals
   - Default State Tests
   - LocalStorage Tests
   - HMAC/Signature Tests
7. **Framework Detection**: Mandatory pre-check
8. **Test File Naming Patterns**
9. **Best Practices** section
10. **Difference from UI_BROWSER_VALIDATOR**: Inspector creates tests, Validator runs them

---

## Acceptance Criteria

- [ ] `core/roles/UI_BROWSER_INSPECTOR/README.md` exists
- [ ] Test categories documented
- [ ] Framework detection explained
- [ ] Test file naming patterns defined
- [ ] Generalized (no PHP-specific code)

---

## Dependencies

- MOD-001: Modular roles structure must exist

---

## Notes

- Source: `/Users/pt/Sites/callbotagent.ai/callbotagent-callrelay/.ai/roles/UI_BROWSER_INSPECTOR/README.md`
- Keep Puppeteer examples but note Playwright as alternative
