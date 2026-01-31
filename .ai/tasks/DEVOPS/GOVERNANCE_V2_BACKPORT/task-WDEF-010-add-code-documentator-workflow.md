# Task: WDEF-010 — Add CODE_DOCUMENTATOR.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create CODE_DOCUMENTATOR.workflow.md for technical documentation workflow.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/documentation/CODE_DOCUMENTATOR.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/documentation/CODE_DOCUMENTATOR.workflow.md`

### Content Requirements

1. **Workflow Name**: Technical Documentation
2. **Trigger**: `@workflow CODE_DOCUMENTATOR <TARGET>`
3. **Modes**:
   - CREATE_FROM_SCRATCH
   - UPDATE_EXISTING
   - EXTEND_MODULE_DOCS
4. **Steps** per mode
5. **Anti-Churn Rules** reference
6. **Output**: `docs/{MODULE}/`

---

## Acceptance Criteria

- [ ] Three modes documented
- [ ] Steps for each mode
- [ ] Reference to SAFEGUARDS.md
