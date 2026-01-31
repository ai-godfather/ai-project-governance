# Task: DOC-003 — Update QUICK_START.md Guide

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: DOCUMENTATION  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update QUICK_START.md with new workflow commands.

---

## Input Requirements

- Read existing: `docs/guides/QUICK_START.md`

---

## Output Requirements

### Files to Modify

1. `docs/guides/QUICK_START.md`

### Content Updates

1. **Update Basic Commands Section**:
   ```
   # Plan a feature (Two-Phase v2.0)
   @workflow PLANNER
   # → Phase 1: Plan created, waits for approval
   # → Phase 2: Tasks generated after approval
   
   # Audit task coverage (NEW)
   @workflow AUDITOR FEATURE_CODE
   
   # Create failing tests (NEW, optional)
   @workflow TDD_GUIDE TASK_ID
   
   # Implement from plan
   @workflow IMPLEMENTER FEATURE_CODE
   ```

2. **Add v2.0 Workflow Section**:
   - Two-Phase PLANNER explanation
   - AUDITOR quality gate explanation
   - TDD_GUIDE optional step

3. **Update Execution Order Diagram**

---

## Acceptance Criteria

- [ ] New commands added
- [ ] Two-Phase PLANNER explained
- [ ] AUDITOR command documented
- [ ] TDD_GUIDE command documented
