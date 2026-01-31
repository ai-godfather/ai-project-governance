# Task: WDEF-008 — Add SMOKE_TESTER.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P2  
> **Status**: pending

---

## Description

Create SMOKE_TESTER.workflow.md for smoke test automation workflow (optional).

---

## Input Requirements

- Read callrelay source: `.ai/workflows/SMOKE_TESTER.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/SMOKE_TESTER.workflow.md`

### Content Requirements

1. **Workflow Name**: Smoke Test Automation
2. **Trigger**: Project-specific command
3. **Steps**:
   - Run smoke test suite
   - Compare against baseline
   - Report regressions
4. **Parameterized Command**: `{{SMOKE_TEST_COMMAND}}`
5. **Optional**: Phase gate integration

---

## Acceptance Criteria

- [ ] Workflow structure documented
- [ ] Parameterized for any test framework
- [ ] Marked as optional enhancement
