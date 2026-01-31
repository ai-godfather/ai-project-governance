# Task: WDEF-012 — Add Workflows README.md Index

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create comprehensive README.md for workflows/ directory with navigation.

---

## Output Requirements

### Files to Create/Update

1. `core/workflows/README.md`

### Content Requirements

1. **Purpose Section**
2. **File Index**:
   | File | Purpose | Trigger |
   |------|---------|---------|
   | PLANNER.workflow.md | Two-Phase planning | `@workflow PLANNER` |
   | AUDITOR.workflow.md | Quality Gate | `@workflow AUDITOR <CODE>` |
   | IMPLEMENTER.workflow.md | Implementation | `@workflow IMPLEMENTER <CODE>` |
   | VALIDATOR_FIXATOR.workflow.md | Validation chain | `@workflow VALIDATOR` |
   | UI_BROWSER_INSPECTOR.workflow.md | E2E generation | `@workflow UI_BROWSER_INSPECTOR <CODE>` |
   | DATA_SEMANTIC_VALIDATOR.workflow.md | Semantic checks | `@workflow DATA_SEMANTIC_VALIDATOR` |
   | SMOKE_TESTER.workflow.md | Smoke tests | Project-specific |
   | documentation/*.workflow.md | Doc workflows | Various |
3. **How to Use** section
4. **Difference from MDC files**

---

## Acceptance Criteria

- [ ] All workflow files indexed
- [ ] Clear navigation
- [ ] Usage guide included
