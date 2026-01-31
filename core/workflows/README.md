# AI Project Governance — Workflow Definitions

> **Version**: 2.0.0  
> **Purpose**: Executable workflow specifications for each role

---

## Overview

This directory contains detailed workflow definitions for each role in the AI Project Governance Framework. Each workflow is a step-by-step specification of how a role should operate.

---

## Workflow Files

| File | Role | Purpose |
|------|------|---------|
| `PLANNER.workflow.md` | PLANNER | Two-Phase feature planning |
| `AUDITOR.workflow.md` | AUDITOR | Quality gate verification |
| `IMPLEMENTER.workflow.md` | IMPLEMENTER | Code execution with TDD CHECK |
| `VALIDATOR_FIXATOR.workflow.md` | VALIDATOR/FIXATOR | Validation and remediation chain |
| `UI_BROWSER_INSPECTOR.workflow.md` | UI_BROWSER_INSPECTOR | E2E test generation |
| `DATA_SEMANTIC_VALIDATOR.workflow.md` | DATA_SEMANTIC_VALIDATOR | Semantic validation |

### Documentation Workflows

| File | Role | Purpose |
|------|------|---------|
| `documentation/CODE_DOCUMENTATOR.workflow.md` | CODE_DOCUMENTATOR | Technical docs |
| `documentation/DOC_GUARD.workflow.md` | DOC_GUARD | Documentation governance |

---

## Workflow Execution Order

```
Standard Feature Flow:

1. PLANNER (Phase 1) → Plan Creation
              ↓
      [USER APPROVAL]
              ↓
2. PLANNER (Phase 2) → Task Generation
              ↓
3. AUDITOR → Quality Gate
              ↓
      ┌───────┴───────┐
      ↓               ↓
   PASS            FAIL
      ↓               ↓
   [TDD_GUIDE]    PLANNER fixes
   (optional)
      ↓
4. IMPLEMENTER → Code Execution
              ↓
5. VALIDATOR → First-pass Validation
              ↓
      ┌───────┴───────┐
      ↓               ↓
   PASS            BLOCK
      ↓               ↓
   Done           FIXATOR
                      ↓
               RE_VALIDATOR
                      ↓
               [Loop until PASS]
```

---

## Workflow Invocation

Each workflow is triggered via `@workflow` command:

| Command | Workflow |
|---------|----------|
| `@workflow PLANNER` | `PLANNER.workflow.md` |
| `@workflow AUDITOR <CODE>` | `AUDITOR.workflow.md` |
| `@workflow IMPLEMENTER <CODE>` | `IMPLEMENTER.workflow.md` |
| `@workflow VALIDATOR` | `VALIDATOR_FIXATOR.workflow.md` |
| `@workflow FIXATOR` | `VALIDATOR_FIXATOR.workflow.md` |
| `@workflow UI_BROWSER_INSPECTOR <CODE>` | `UI_BROWSER_INSPECTOR.workflow.md` |
| `@workflow DATA_SEMANTIC_VALIDATOR` | `DATA_SEMANTIC_VALIDATOR.workflow.md` |
| `@workflow CODE_DOCUMENTATOR` | `documentation/CODE_DOCUMENTATOR.workflow.md` |
| `@workflow DOC_GUARD` | `documentation/DOC_GUARD.workflow.md` |

---

## Workflow Structure

Each workflow file follows this structure:

```markdown
# {ROLE} Workflow

> **Version**: X.X.X
> **Invocation**: `@workflow {ROLE} [args]`
> **Mode**: READ-ONLY / WRITE

---

## Overview

[Brief description]

---

## Workflow Steps

[ASCII diagram of workflow]

---

## Input Requirements

[What the workflow needs]

---

## Output Requirements

[What the workflow produces]

---

## Quality Gates

[Checkpoints that must pass]

---

## Forbidden Actions

[What the role MUST NOT do]
```

---

## Related Files

- `core/roles/*/README.md` — Role definitions
- `core/workflow/*.md` — Workflow documentation
- `adapters/cursor-rules/*.mdc` — Enforcement layer

---

**Version**: 2.0.0  
**Framework**: AI Project Governance
