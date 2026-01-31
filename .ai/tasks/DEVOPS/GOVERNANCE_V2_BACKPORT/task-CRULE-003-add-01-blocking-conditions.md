# Task: CRULE-003 — Add 01-blocking-conditions.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 01-blocking-conditions.mdc template with BLOCK/STOP conditions.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/01-blocking-conditions.mdc`

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/01-blocking-conditions.mdc`

### Content Requirements

1. **Priority**: CRITICAL
2. **PLANNER BLOCKS**:
   - Tasks without user approval
   - V2/V3 without PREDECESSOR FEATURE ANALYSIS (FP-067)
   - API without response structure (FP-054)
   - UI metric without semantic definition (FP-050)
   - Migration without COLUMN USAGE MAP (FP-066)
   - Rate limiting without task (FP-065)
3. **AUDITOR BLOCKS**:
   - Task references non-existent field (FP-064)
   - Task count mismatch (FP-055)
   - API Schema missing (FP-054)
4. **VALIDATOR BLOCKS**:
   - TASK_INDEX status mismatch (FP-068)
   - Documentation incomplete (FP-069)
5. **TDD_GUIDE BLOCKS**:
   - No API RESPONSE STRUCTURE
   - No METRIC SEMANTIC DEFINITIONS
6. **FIXATOR BLOCKS**:
   - ORIGIN_LAYER = FEATURE_PLAN + BLOCK
   - Fix would change semantic intent
7. **IMPLEMENTER BLOCKS**:
   - No plan found
   - AUDITOR verdict ≠ PASS
8. **BLOCK Resolution Flow** diagram
9. **Warning Conditions** (non-blocking)

---

## Acceptance Criteria

- [ ] All blocking conditions by role
- [ ] FP-IDs referenced
- [ ] Resolution flow
- [ ] Warning vs block distinction

---

## Notes

Generalize by removing project-specific references.
