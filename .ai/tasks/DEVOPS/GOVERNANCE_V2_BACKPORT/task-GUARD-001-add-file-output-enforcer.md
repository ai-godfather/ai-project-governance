# Task: GUARD-001 — Add file-output-enforcer.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: RUNTIME_GUARDS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the file-output-enforcer.md runtime guard for output enforcement mechanism.

---

## Input Requirements

- Read callrelay source: `.ai/runtime/file-output-enforcer.md`

---

## Output Requirements

### Files to Create

1. `core/runtime/file-output-enforcer.md`

### Content Requirements

1. **Purpose**: Ensures all workflow roles save outputs to files, not chat
2. **Enforcement Matrix**:
   | Role | Must Create Files | Must Update Files |
   |------|-------------------|-------------------|
   | PLANNER | Plan + Tasks | TASKS.md |
   | IMPLEMENTER | Code files | Changelog snapshot |
   | VALIDATOR | Validation report | — |
   | FIXATOR | Fix report | Changelog snapshot |
   | RE_VALIDATOR | Re-validation report | — |
   | CODE_DOCUMENTATOR | Documentation files | — |
   | DOC_GUARD | Detection report | — |
   | AUDITOR | Audit report | — |
   | TDD_GUIDE | Test files + report | — |

3. **Target Locations** table
4. **Validation Steps** (pseudocode)
5. **Common Violations** table
6. **What Goes to Chat (Allowed)** table
7. **Enforcement Trigger**: Workflow guard integration
8. **Recovery from Violation** section

---

## Acceptance Criteria

- [ ] File created at `core/runtime/file-output-enforcer.md`
- [ ] All roles in enforcement matrix
- [ ] Validation steps documented
- [ ] Generalized (no project-specific)

---

## Dependencies

None
