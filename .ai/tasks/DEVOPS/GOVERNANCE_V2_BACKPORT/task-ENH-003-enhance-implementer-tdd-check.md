# Task: ENH-003 — Enhance IMPLEMENTER with TDD CHECK

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Enhance the IMPLEMENTER role with mandatory TDD CHECK and immediate TASK_INDEX update requirement (FP-068).

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (IMPLEMENTER section)
- Read existing v1.0: `core/workflow/03_ROLES.md` (IMPLEMENTER)

---

## Output Requirements

### Files to Modify/Create

1. `core/roles/IMPLEMENTER/README.md` — Enhanced role documentation

### Content Requirements (New Sections)

1. **Version**: 2.0.0 (Immediate Status Update)

2. **🔴 TDD CHECK (MANDATORY)**:
   ```
   Before implementing code, IMPLEMENTER MUST:
   1. Search for tests: find tests/ -path "*{Module}*" -name "*Test.*"
   2. Run tests: {{TEST_COMMAND}}
   3. Evaluate:
      - Tests FAIL → TDD MODE: implement to make GREEN
      - Tests PASS → Proceed normally
      - No tests → Log in changelog, continue
   
   Violation: Implementing without TDD check = workflow breach
   ```

3. **🔴 TASK_INDEX IMMEDIATE UPDATE (v2.0 — FP-068)**:
   ```
   After completing EACH task, IMPLEMENTER MUST:
   1. Update task file status to `completed`
   2. Update TASK_INDEX.md immediately (not at end of session)
   ```

4. **AUDITOR Gate Requirement**:
   - IMPLEMENTER CANNOT proceed without AUDITOR PASS

5. **New Forbidden Actions**:
   - ❌ Implement without checking for tests first
   - ❌ Proceed to next task without updating TASK_INDEX
   - ❌ Batch status updates at end of session

---

## Acceptance Criteria

- [ ] TDD CHECK workflow documented
- [ ] TASK_INDEX immediate update requirement (FP-068)
- [ ] AUDITOR gate mentioned
- [ ] v2.0.0 version noted
- [ ] Parameterized (`{{TEST_COMMAND}}`)

---

## Dependencies

- MOD-001: Modular roles structure must exist
