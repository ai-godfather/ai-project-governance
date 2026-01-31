# Task: ENH-006 — Create UI_BROWSER_VALIDATOR OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for UI_BROWSER_VALIDATOR role.

---

## Input Requirements

- Read callrelay source: `.ai/roles/UI_BROWSER_VALIDATOR/OUTPUT_RULES.md`

---

## Output Requirements

### Files to Create

1. `core/roles/UI_BROWSER_VALIDATOR/OUTPUT_RULES.md`

### Content Requirements

1. **Mandatory Output Files**:
   - Validation report: `.ai/_PLANS_VALIDATIONS/{FEATURE}/UI_BROWSER_VALIDATION_*.md`
2. **Report Structure**:
   - Test Execution Summary
   - Test Results
   - Failed Test Details
   - MCP Browser Visual Checks
   - Verdict
   - Recommended Next Step
3. **Required Sections for Database Testing**:
   - Test Data Source
   - Filter Tests
   - Search Tests

---

## Acceptance Criteria

- [ ] OUTPUT_RULES.md exists
- [ ] Report structure defined
- [ ] Database testing sections included
