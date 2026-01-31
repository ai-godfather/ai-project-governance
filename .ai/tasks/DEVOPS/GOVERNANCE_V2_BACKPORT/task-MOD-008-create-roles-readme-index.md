# Task: MOD-008 — Create Roles README.md Index

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create comprehensive README.md index at core/roles/ root.

---

## Output Requirements

### Files to Create

1. `core/roles/README.md`

### Content Requirements

1. **Purpose**: Modular role definitions
2. **Role Index** (16 roles):
   | # | Role | Folder | Mode |
   |---|------|--------|------|
   | 0 | EMERGENCY_ERROR | `EMERGENCY_ERROR/` | Orchestrator |
   | 1 | PLANNER | `PLANNER/` | Read-Only |
   | ... | ... | ... | ... |
   | 15 | TDD_GUIDE | `TDD_GUIDE/` | Write (tests) |
3. **Folder Structure**:
   - README.md — Role overview
   - OUTPUT_RULES.md — File output enforcement (some roles)
   - SAFEGUARDS.md — Anti-churn rules (CODE_DOCUMENTATOR only)
4. **Quick Reference**: Role by purpose

---

## Acceptance Criteria

- [ ] All 16 roles indexed
- [ ] Folder contents described
- [ ] Navigation links work
