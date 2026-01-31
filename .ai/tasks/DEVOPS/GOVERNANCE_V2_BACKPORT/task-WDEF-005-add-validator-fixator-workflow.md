# Task: WDEF-005 — Add VALIDATOR_FIXATOR.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create VALIDATOR_FIXATOR.workflow.md with validation chain workflow definition.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/VALIDATOR_FIXATOR.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/VALIDATOR_FIXATOR.workflow.md`

### Content Requirements

1. **VALIDATOR Workflow**:
   - Trigger: `@workflow VALIDATOR`
   - Steps: FP checks, Documentation Gate, TASK_INDEX check
   - Verdicts: PASS | BLOCK
   - ORIGIN_LAYER classification required
   
2. **FIXATOR Workflow**:
   - Trigger: `@workflow FIXATOR`
   - Pre-check: Verify ORIGIN_LAYER allows fix
   - Scope lock enforcement
   - Fix implementation
   - Hook compliance
   
3. **RE_VALIDATOR Workflow**:
   - Trigger: `@workflow RE_VALIDATOR`
   - Verify each issue resolved
   - Check no new issues
   - Final verdict

4. **Chain Flow**: VALIDATOR → FIXATOR → RE_VALIDATOR

---

## Acceptance Criteria

- [ ] Three roles in one document
- [ ] Chain flow documented
- [ ] ORIGIN_LAYER routing
- [ ] Documentation Gate (FP-069)
