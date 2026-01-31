# Task: CRULE-005 — Add 03-failure-patterns-critical.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 03-failure-patterns-critical.mdc template with critical FP quick reference.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/03-failure-patterns-critical.mdc`

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/03-failure-patterns-critical.mdc`

### Content Requirements

1. **Priority**: HIGH
2. **Data Semantic Patterns** (FP-050 to FP-056) table:
   - FP-ID, Pattern, Detection, Prevention
3. **Process Patterns** (FP-057 to FP-069) table:
   - FP-ID, Pattern, Detection, Prevention
4. **Detection Responsibility** by role:
   | Role | Detects |
   |------|---------|
   | PLANNER | FP-061, FP-067 |
   | AUDITOR | FP-054, FP-055, FP-060, FP-064, FP-066, FP-067 |
   | TDD_GUIDE | FP-054 |
   | VALIDATOR | FP-056, FP-062, FP-063, FP-065, FP-068, FP-069 |
   | DATA_SEMANTIC_VALIDATOR | FP-050 to FP-053, FP-058, FP-059 |
5. **Link to Full Reference**: `core/workflow/05_FAILURE_PATTERNS.md`

---

## Acceptance Criteria

- [ ] FP-050 to FP-069 listed
- [ ] Detection responsibilities
- [ ] Prevention methods
- [ ] Link to full reference

---

## Notes

Remove project-specific FP-CR-* patterns (those go in project-context template).
