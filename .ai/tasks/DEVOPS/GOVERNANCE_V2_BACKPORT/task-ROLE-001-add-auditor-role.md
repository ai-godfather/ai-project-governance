# Task: ROLE-001 — Add AUDITOR Role

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the AUDITOR role as a quality gate between PLANNER and IMPLEMENTER. AUDITOR verifies that generated tasks are a faithful projection of the feature plan.

---

## Input Requirements

- Read callrelay source: `.ai/roles/AUDITOR/README.md`
- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (AUDITOR section)
- Understand 15 audit dimensions

---

## Output Requirements

### Files to Create

1. `core/roles/AUDITOR/README.md` — Full role documentation

### Content Requirements

The AUDITOR README.md must include:

1. **Purpose**: Quality gate between PLANNER and IMPLEMENTER
2. **Mode**: READ-ONLY / STRICT
3. **Command**: `@workflow AUDITOR <FEATURE_CODE>`
4. **Output Location**: `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/PLANNER_AUDIT_{date}.md`
5. **Core Principle**: "FEATURE PLAN IS SUPREME"
6. **15 Audit Dimensions**:
   - Coverage Completeness
   - Phase Alignment
   - Task Granularity
   - Forbidden Additions
   - Guardrails Fidelity
   - Test Coverage
   - API Schema Presence (FP-054)
   - Metric Definitions Presence (FP-050/051)
   - Task Count Verification (FP-055)
   - Service Interface Listing (FP-057)
   - Graceful Degradation (FP-058)
   - Table Dependency Declaration (FP-059)
   - ASCII Mockup Coverage (FP-060)
   - Mockup Line References (FP-060)
   - Long Prompt Section Scan (FP-061)
7. **Verdicts**: PASS | PARTIAL | FAIL
8. **Workflow Position**: PLANNER → [AUDITOR] → IMPLEMENTER
9. **Allowed Actions** list
10. **Forbidden Actions** list
11. **Before Audit Checklist**
12. **API Schema Check** section
13. **Metric Definitions Check** section
14. **Task Count Verification** section

---

## Acceptance Criteria

- [ ] `core/roles/AUDITOR/README.md` exists
- [ ] All 15 audit dimensions documented
- [ ] Verdicts (PASS/PARTIAL/FAIL) with criteria
- [ ] Workflow position diagram
- [ ] FP-054, FP-055, FP-057 to FP-061 referenced
- [ ] Allowed/Forbidden actions listed
- [ ] Generalized (no PHP/CallRelay specifics)

---

## Dependencies

- MOD-001: Modular roles structure must exist

---

## Notes

- Source: `/Users/pt/Sites/callbotagent.ai/callbotagent-callrelay/.ai/roles/AUDITOR/README.md`
- Generalize all PHP-specific references
