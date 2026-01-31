# Task: ENH-004 — Enhance VALIDATOR with Documentation Gate

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Enhance the VALIDATOR role with Documentation Gate (FP-069) and TASK_INDEX verification (FP-068).

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (VALIDATOR section)
- Read existing v1.0: `core/workflow/03_ROLES.md` (VALIDATOR)

---

## Output Requirements

### Files to Modify/Create

1. `core/roles/VALIDATOR/README.md` — Enhanced role documentation

### Content Requirements (New Sections)

1. **Version**: 2.0.0 (Documentation Gate)

2. **Extended FP Coverage**: FP-002 to FP-016, **FP-065 to FP-069**

3. **New Blocking Conditions (v2.0)**:
   | Check | FP-ID | Blocking? |
   |-------|-------|-----------|
   | Module docs created | FP-069 | 🔴 BLOCK |
   | Changelog entry added | FP-069 | 🔴 BLOCK |
   | TASK_INDEX status matches code | FP-068 | 🔴 BLOCK |
   | Migration column used | FP-066 | ⚠️ WARN |
   | Rate limiting implemented | FP-065 | ⚠️ WARN |

4. **Documentation Gate Enforcement**:
   - VALIDATOR now enforces documentation completion
   - Missing docs = BLOCK verdict

---

## Acceptance Criteria

- [ ] Documentation Gate documented
- [ ] Blocking conditions table with FP-IDs
- [ ] FP-065 to FP-069 referenced
- [ ] v2.0.0 version noted

---

## Dependencies

- MOD-001: Modular roles structure must exist
- FP-001: Data Semantic patterns exist
- FP-002: Process patterns exist
