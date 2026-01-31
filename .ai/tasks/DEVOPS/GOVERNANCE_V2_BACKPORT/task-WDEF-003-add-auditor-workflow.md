# Task: WDEF-003 — Add AUDITOR.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create AUDITOR.workflow.md with Quality Gate workflow definition.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/AUDITOR.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/AUDITOR.workflow.md`

### Content Requirements

1. **Workflow Name**: AUDITOR Quality Gate
2. **Trigger**: `@workflow AUDITOR <FEATURE_CODE>`
3. **Steps**:
   - Locate feature plan
   - Locate task files
   - Perform 15 audit dimensions
   - Calculate coverage
   - Generate verdict
   - Save audit report
4. **Verdicts**: PASS | PARTIAL | FAIL
5. **Next Steps** by verdict
6. **Output Artifacts**: Audit report location

---

## Acceptance Criteria

- [ ] 15 audit dimensions listed
- [ ] Verdict criteria documented
- [ ] Next steps for each verdict
- [ ] Output location specified
