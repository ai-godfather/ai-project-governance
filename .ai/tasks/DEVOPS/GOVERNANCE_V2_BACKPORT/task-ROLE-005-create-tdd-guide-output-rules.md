# Task: ROLE-005 — Create TDD_GUIDE OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for TDD_GUIDE role, defining file output enforcement requirements.

---

## Input Requirements

- Read callrelay source: `.ai/roles/TDD_GUIDE/OUTPUT_RULES.md`

---

## Output Requirements

### Files to Create

1. `core/roles/TDD_GUIDE/OUTPUT_RULES.md` — Output enforcement rules

### Content Requirements

1. **Mandatory Output Files**:
   - Test files: `tests/**/*.{test_extension}`
   - TDD Report: `.ai/_PLANS_VALIDATIONS/{FEATURE}/TDD_GUIDE_REPORT_{date}.md`
2. **Report Structure**:
   - Pre-Test Checks Performed
   - Tests Created (ALL FAILING)
   - Test Run Evidence
   - Handoff to IMPLEMENTER
3. **Scope Lock**:
   - MAY write: `tests/**/*`
   - MUST NOT write: `src/**/*`, implementation files
4. **Validation Steps**

---

## Acceptance Criteria

- [ ] `core/roles/TDD_GUIDE/OUTPUT_RULES.md` exists
- [ ] Output locations defined
- [ ] Scope lock clearly stated
- [ ] Report structure template

---

## Dependencies

- ROLE-002: TDD_GUIDE role must exist
