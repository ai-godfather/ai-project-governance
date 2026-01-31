# Task: WDOC-001 — Update 03_ROLES.md to 16 Roles

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 03_ROLES.md to include 16 roles (add AUDITOR, TDD_GUIDE, UI_BROWSER_INSPECTOR) and Hook Compliance section.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md`
- Read existing v1.0: `core/workflow/03_ROLES.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/03_ROLES.md`

### Content Requirements

1. **Role Index**: Update to 16 roles (0-15)
2. **Add New Roles**:
   - #13: AUDITOR
   - #14: DOC_GUARD (move from #13)
   - #15: TDD_GUIDE
3. **Add Enhanced Sections**:
   - PLANNER: Two-Phase, v2.0
   - IMPLEMENTER: TDD CHECK, v2.0
   - VALIDATOR: Documentation Gate, v2.0
   - UI_BROWSER_VALIDATOR: v3.0 Puppeteer
4. **Add UI_BROWSER_INSPECTOR (6a)**
5. **Add Hook Compliance Section**:
   - Available Hooks table
   - Hook Compliance Declaration template
   - When to Apply matrix
   - Parameterized commands (`{{LINTER_COMMAND}}`, etc.)
6. **Update Implementation Authority Table**: 16 roles

---

## Acceptance Criteria

- [ ] 16 roles documented
- [ ] AUDITOR, TDD_GUIDE, UI_BROWSER_INSPECTOR added
- [ ] Enhanced role versions noted
- [ ] Hook Compliance section added
- [ ] Implementation Authority updated

---

## Dependencies

- ROLE-001, ROLE-002, ROLE-003: New roles defined
- ENH-001 to ENH-005: Enhanced roles defined
