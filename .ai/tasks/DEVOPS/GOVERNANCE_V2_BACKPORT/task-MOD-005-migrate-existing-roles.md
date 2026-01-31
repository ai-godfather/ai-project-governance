# Task: MOD-005 — Migrate Existing Roles to Folders

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Move existing flat role files to new folder structure.

---

## Input Requirements

- Read existing v1.0 files:
  - `core/roles/CODE_DOCUMENTATOR.md`
  - `core/roles/CODE_DOCUMENTATOR_SAFEGUARDS.md`
  - `core/roles/USER_DOCUMENTATOR.md`

---

## Output Requirements

### Files to Move/Transform

1. `CODE_DOCUMENTATOR.md` → `CODE_DOCUMENTATOR/README.md`
2. `CODE_DOCUMENTATOR_SAFEGUARDS.md` → `CODE_DOCUMENTATOR/SAFEGUARDS.md`
3. `USER_DOCUMENTATOR.md` → `USER_DOCUMENTATOR/README.md`

### After Migration

Delete old flat files (or keep as backup during transition).

---

## Acceptance Criteria

- [ ] All existing content preserved
- [ ] New folder structure
- [ ] Old files removed or marked deprecated

---

## Dependencies

- MOD-001: Folder structure created
