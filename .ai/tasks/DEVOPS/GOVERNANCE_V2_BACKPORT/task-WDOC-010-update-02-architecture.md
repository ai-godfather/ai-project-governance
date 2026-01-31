# Task: WDOC-010 — Update 02_ARCHITECTURE.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 02_ARCHITECTURE.md with AUDITOR gate in diagram.

---

## Input Requirements

- Read existing v1.0: `core/workflow/02_ARCHITECTURE.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/02_ARCHITECTURE.md`

### Content Requirements

1. **Update Architecture Diagram**:
   ```
   PLANNER → [AUDITOR] → [TDD_GUIDE] → IMPLEMENTER → VALIDATOR → ...
                ↑              ↑
           Quality Gate   Optional RED Phase
   ```

2. **Update Role Hierarchy**: 16 roles

3. **Add Data Flow** for new roles:
   - AUDITOR reads plan and tasks, outputs audit report
   - TDD_GUIDE reads task, outputs failing tests

---

## Acceptance Criteria

- [ ] AUDITOR in architecture diagram
- [ ] TDD_GUIDE position shown
- [ ] 16 roles in hierarchy
