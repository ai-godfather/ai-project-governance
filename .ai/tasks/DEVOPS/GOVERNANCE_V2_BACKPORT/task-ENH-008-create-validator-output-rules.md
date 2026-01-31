# Task: ENH-008 — Create VALIDATOR OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for VALIDATOR role.

---

## Input Requirements

- Read callrelay source: `.ai/roles/VALIDATOR/README.md` (output sections)

---

## Output Requirements

### Files to Create

1. `core/roles/VALIDATOR/OUTPUT_RULES.md`

### Content Requirements

1. **Mandatory Output Files**:
   - Validation report: `.ai/_PLANS_VALIDATIONS/{FEATURE}/VALIDATION_*.md`
2. **Report Structure**:
   - Validation Summary
   - Issues Found (with ORIGIN_LAYER)
   - FP Checks Performed
   - Documentation Gate Status
   - TASK_INDEX Verification
   - Verdict
3. **ORIGIN_LAYER Required**: Every issue must have classification

---

## Acceptance Criteria

- [ ] OUTPUT_RULES.md exists
- [ ] Report structure defined
- [ ] ORIGIN_LAYER requirement documented
