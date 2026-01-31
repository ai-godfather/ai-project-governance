# Task: MOD-007 — Update Role References in Workflow Docs

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update all references to role files throughout workflow documentation to point to new modular structure.

---

## Files to Update

1. `core/workflow/03_ROLES.md` — Add links to `core/roles/{ROLE}/README.md`
2. `core/workflow/04_EXECUTION_ORDER.md` — Update role references
3. `core/runtime/workflow-guard.md` — Update paths
4. Bootstrap templates — Update role paths

---

## Acceptance Criteria

- [ ] All role references updated
- [ ] Links work correctly
- [ ] No broken references

---

## Dependencies

- MOD-006: All role folders exist
