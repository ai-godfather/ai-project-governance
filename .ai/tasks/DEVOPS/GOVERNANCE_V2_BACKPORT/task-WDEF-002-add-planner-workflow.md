# Task: WDEF-002 — Add PLANNER.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create PLANNER.workflow.md with Two-Phase workflow definition.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/PLANNER.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/PLANNER.workflow.md`

### Content Requirements

1. **Workflow Name**: PLANNER Two-Phase Workflow
2. **Version**: 2.0.0
3. **Trigger**: `@workflow PLANNER`
4. **Phase 1 Steps**:
   - Read feature request
   - Analyze existing system
   - Create plan file
   - Include mandatory sections
   - Output approval request
   - 🛑 STOP
5. **Phase 2 Steps** (after approval):
   - Create task files
   - Update TASKS.md
   - Output confirmation
6. **Blocking Conditions**
7. **Output Artifacts**
8. **Next Step**: AUDITOR

---

## Acceptance Criteria

- [ ] Two-phase workflow clearly defined
- [ ] Approval gate documented
- [ ] All steps listed
- [ ] Output artifacts specified
