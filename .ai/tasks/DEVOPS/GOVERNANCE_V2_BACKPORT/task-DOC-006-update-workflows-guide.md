# Task: DOC-006 — Update WORKFLOWS.md Guide

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: DOCUMENTATION  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update WORKFLOWS.md guide with new execution order.

---

## Input Requirements

- Read existing: `docs/guides/WORKFLOWS.md`

---

## Output Requirements

### Files to Modify

1. `docs/guides/WORKFLOWS.md`

### Content Updates

1. **Update Standard Feature Flow**:
   ```
   1. PLANNER Phase 1 → Plan created
   2. [USER APPROVAL]
   3. PLANNER Phase 2 → Tasks generated
   4. AUDITOR → Quality Gate
   5. TDD_GUIDE [optional] → RED phase
   6. IMPLEMENTER → GREEN phase
   7. VALIDATOR → Documentation Gate
   8-11. Inspectors
   12. FIXATOR (if BLOCK)
   13. RE_VALIDATOR
   ```

2. **Add AUDITOR Gate Section**
3. **Add TDD Workflow Section**
4. **Add Documentation Gate Section**
5. **Update Workflow Diagram**

---

## Acceptance Criteria

- [ ] New execution order
- [ ] AUDITOR gate explained
- [ ] TDD workflow explained
- [ ] Documentation Gate explained
