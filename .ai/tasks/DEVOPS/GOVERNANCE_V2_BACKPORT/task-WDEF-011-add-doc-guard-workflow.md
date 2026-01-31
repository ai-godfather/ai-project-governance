# Task: WDEF-011 — Add DOC_GUARD.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create DOC_GUARD.workflow.md for documentation governance workflow.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/documentation/DOC_GUARD.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/documentation/DOC_GUARD.workflow.md`

### Content Requirements

1. **Workflow Name**: Documentation Governance
2. **Trigger**: `@workflow DOC_GUARD`
3. **Position**: After IMPLEMENTER, before VALIDATOR
4. **Steps**:
   - Analyze git diff
   - Detect patterns (new jobs, dangerous ops)
   - Classify: HARD BLOCKER vs ADVISORY
   - Generate report
5. **Hard Blockers** (only 2):
   - New job without docs
   - DANGEROUS operation without safety docs
6. **Advisory Items**: Continue workflow with warning
7. **Output**: DOC_GUARD_REPORT.md

---

## Acceptance Criteria

- [ ] Two hard blockers documented
- [ ] Advisory vs blocking distinction
- [ ] Report structure defined
