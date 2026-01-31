# Task: WDEF-004 — Add IMPLEMENTER.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create IMPLEMENTER.workflow.md with implementation workflow definition.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/IMPLEMENTER.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/IMPLEMENTER.workflow.md`

### Content Requirements

1. **Workflow Name**: IMPLEMENTER Execution
2. **Trigger**: `@workflow IMPLEMENTER <FEATURE_CODE>`
3. **Pre-Execution Checks**:
   - Verify AUDITOR PASS
   - Locate plan and tasks
4. **TDD CHECK Step** (mandatory):
   - Search for tests
   - Run tests
   - Evaluate: FAIL → TDD MODE, PASS → normal, No tests → log
5. **Implementation Loop**:
   - For each task:
     - Implement code
     - Update task status immediately
     - Update TASK_INDEX immediately (FP-068)
6. **Post-Implementation**:
   - Update changelog
   - Hook compliance declaration
7. **Next Step**: VALIDATOR

---

## Acceptance Criteria

- [ ] AUDITOR gate check
- [ ] TDD CHECK workflow
- [ ] Immediate status update (FP-068)
- [ ] Hook compliance mentioned
