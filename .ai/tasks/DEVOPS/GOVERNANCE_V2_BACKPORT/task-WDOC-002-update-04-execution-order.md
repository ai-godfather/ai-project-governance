# Task: WDOC-002 — Update 04_EXECUTION_ORDER.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 04_EXECUTION_ORDER.md with Two-Phase PLANNER, AUDITOR Gate, and Documentation Gate.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/04_EXECUTION_ORDER.md`
- Read existing v1.0: `core/workflow/04_EXECUTION_ORDER.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/04_EXECUTION_ORDER.md`

### Content Requirements

1. **Standard Feature Flow** (updated to 14 steps):
   ```
   1. PLANNER (Phase 1) → Feature plan created
   2. [USER APPROVAL]
   3. PLANNER (Phase 2) → Task files generated
   4. AUDITOR → Task fidelity verified (Quality Gate)
   5. TDD_GUIDE [OPTIONAL] → Create failing tests (RED phase)
   6. IMPLEMENTER → Code written (GREEN phase if TDD)
   7. VALIDATOR → First-pass validation + Documentation Gate
   8. UI_INSPECTOR
   9. DATA_SEMANTIC_VALIDATOR
   10. UI_BROWSER_VALIDATOR
   11. FIXATOR (if BLOCK)
   12. RE_VALIDATOR
   ```

2. **Two-Phase PLANNER Section**: Full diagram

3. **AUDITOR Gate Rule**:
   - Verdicts: PASS | PARTIAL | FAIL
   - "IMPLEMENTER CANNOT PROCEED WITHOUT AUDITOR PASS"

4. **Documentation Gate (v2.0 — BLOCKING)**:
   | Check | Blocking? |
   |-------|-----------|
   | Module docs created | 🔴 BLOCK |
   | Changelog entry added | 🔴 BLOCK |
   | TASK_INDEX status matches | 🔴 BLOCK |

5. **Updated Cheat Sheet**:
   ```
   PLAN → AUDIT → CODE → CHECK → VISUAL → SEMANTIC → BROWSER → FIX → VERIFY
   ```

---

## Acceptance Criteria

- [ ] Two-Phase PLANNER flow documented
- [ ] AUDITOR Gate Rule section
- [ ] TDD_GUIDE position shown
- [ ] Documentation Gate section
- [ ] Updated cheat sheet

---

## Dependencies

- ROLE-001: AUDITOR role
- ROLE-002: TDD_GUIDE role
- ENH-001: Two-Phase PLANNER
- ENH-004: Documentation Gate
