# Task: ROLE-004 — Create AUDITOR OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for AUDITOR role, defining file output enforcement requirements.

---

## Input Requirements

- Read callrelay source: `.ai/roles/AUDITOR/OUTPUT_RULES.md`
- Understand file output enforcement pattern

---

## Output Requirements

### Files to Create

1. `core/roles/AUDITOR/OUTPUT_RULES.md` — Output enforcement rules

### Content Requirements

1. **Mandatory Output Files**:
   - Audit report: `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/PLANNER_AUDIT_{date}.md`
2. **Report Structure**:
   - Coverage Matrix
   - Audit Dimensions Table
   - Verdict with Criteria
   - Next Steps
3. **Forbidden**:
   - Chat-only output
   - Summary without file save
4. **Validation Steps**

---

## Acceptance Criteria

- [ ] `core/roles/AUDITOR/OUTPUT_RULES.md` exists
- [ ] Output location defined
- [ ] Report structure template
- [ ] Forbidden actions listed

---

## Dependencies

- ROLE-001: AUDITOR role must exist
