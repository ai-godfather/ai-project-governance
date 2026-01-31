# Task: ROLE-006 — Create UI_BROWSER_INSPECTOR OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for UI_BROWSER_INSPECTOR role, defining file output enforcement requirements.

---

## Input Requirements

- Read callrelay source: `.ai/roles/UI_BROWSER_INSPECTOR/OUTPUT_RULES.md`

---

## Output Requirements

### Files to Create

1. `core/roles/UI_BROWSER_INSPECTOR/OUTPUT_RULES.md` — Output enforcement rules

### Content Requirements

1. **Mandatory Output Files**:
   - Test files: `e2e-tests/tests/{feature}-*.test.js`
   - Validation report (optional)
2. **Test File Naming**:
   - Entity CRUD: `{entity}.test.js`
   - UI Forms: `{feature}-ui.test.js`
   - API via UI: `{feature}-api.test.js`
   - Defaults: `{feature}-defaults.test.js`
3. **Framework Detection**: Required before generation
4. **Validation Steps**

---

## Acceptance Criteria

- [ ] `core/roles/UI_BROWSER_INSPECTOR/OUTPUT_RULES.md` exists
- [ ] Test file naming patterns defined
- [ ] Framework detection noted

---

## Dependencies

- ROLE-003: UI_BROWSER_INSPECTOR role must exist
