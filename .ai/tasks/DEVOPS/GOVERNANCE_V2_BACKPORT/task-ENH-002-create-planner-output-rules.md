# Task: ENH-002 — Create PLANNER OUTPUT_RULES

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the OUTPUT_RULES.md file for PLANNER role, defining file output enforcement requirements.

---

## Input Requirements

- Read callrelay source: `.ai/roles/PLANNER/OUTPUT_RULES.md`

---

## Output Requirements

### Files to Create

1. `core/roles/PLANNER/OUTPUT_RULES.md` — Output enforcement rules

### Content Requirements

1. **Mandatory Output Files**:
   - Plan file: `.ai/plans/features/{CATEGORY}/{FEATURE_CODE}_*.md`
   - Task files: `.ai/tasks/{CATEGORY}/{FEATURE_CODE}/task*.md`
   - Index update: `.ai/TASKS.md`
2. **Two-Phase Enforcement**:
   - Phase 1: Plan file MUST be saved
   - Phase 2: Task files MUST be saved (after approval)
3. **Forbidden**:
   - Plan in chat only
   - Tasks generated without approval
   - Tasks in chat without files
4. **Validation Steps**

---

## Acceptance Criteria

- [ ] `core/roles/PLANNER/OUTPUT_RULES.md` exists
- [ ] Two-phase enforcement documented
- [ ] All output locations defined
- [ ] Validation steps included

---

## Dependencies

- ENH-001: PLANNER enhancement must exist
