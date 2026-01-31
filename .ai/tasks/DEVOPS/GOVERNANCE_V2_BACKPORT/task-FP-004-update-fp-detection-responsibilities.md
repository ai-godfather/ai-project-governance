# Task: FP-004 — Update FP Detection Responsibilities

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: FAILURE_PATTERNS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update failure pattern documentation with role assignments for new patterns and AUDITOR/TDD_GUIDE responsibilities.

---

## Output Requirements

### Files to Modify

1. `core/workflow/05_FAILURE_PATTERNS.md`

### Content Requirements

1. **Update FP Checks by Role** section:
   
   | Role | Detects |
   |------|---------|
   | PLANNER | FP-061, FP-067 (at creation) |
   | AUDITOR | FP-054, FP-055, FP-057, FP-060, FP-064, FP-066, FP-067 |
   | TDD_GUIDE | FP-054 (blocks test creation) |
   | VALIDATOR | FP-056, FP-062, FP-063, FP-065, FP-068, FP-069 |
   | DATA_SEMANTIC_VALIDATOR | FP-050 to FP-053, FP-058, FP-059 |
   | FIXATOR | Implementation fixes |

2. **Update ORIGIN_LAYER mapping table**

---

## Acceptance Criteria

- [ ] All roles have FP assignments
- [ ] AUDITOR FPs listed
- [ ] TDD_GUIDE FPs listed
- [ ] ORIGIN_LAYER mappings updated

---

## Dependencies

- FP-001: Data Semantic patterns
- FP-002: Process patterns
