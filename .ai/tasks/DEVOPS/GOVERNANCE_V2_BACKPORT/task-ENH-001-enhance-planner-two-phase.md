# Task: ENH-001 — Enhance PLANNER with Two-Phase Workflow

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Enhance the PLANNER role with Two-Phase workflow (plan → user approval → tasks) and 35 absolute prohibitions.

---

## Input Requirements

- Read callrelay source: `.ai/roles/PLANNER/README.md`
- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (PLANNER section)
- Read existing v1.0: `core/workflow/03_ROLES.md` (PLANNER)

---

## Output Requirements

### Files to Modify/Create

1. `core/roles/PLANNER/README.md` — Enhanced role documentation

### Content Requirements (New Sections)

1. **Two-Phase Workflow**:
   ```
   PHASE 1: PLAN CREATION
   ├── Create plan file
   ├── Include metric definitions
   ├── Include API schemas
   ├── Output approval request to chat
   └── 🛑 STOP — Wait for user approval
   
   [USER APPROVAL]
   
   PHASE 2: TASK GENERATION
   ├── Create ALL task files
   ├── Update TASKS.md
   └── Output confirmation
   ```

2. **Version**: 2.0.0 (Two-Phase Workflow)

3. **Output Files**:
   - Plan: `.ai/plans/features/{CATEGORY}/{FEATURE_CODE}_*.md`
   - Tasks: `.ai/tasks/{CATEGORY}/{FEATURE_CODE}/task*.md`
   - Index: `.ai/TASKS.md`

4. **Conditional Mandatory Sections**:
   | Condition | Required Section |
   |-----------|------------------|
   | V2/V3/DEFAULTS plan | PREDECESSOR FEATURE ANALYSIS (FP-067) |
   | Plan with migrations | MIGRATION COLUMN USAGE MAP (FP-066) |
   | Plan with UI metrics | METRIC SEMANTIC DEFINITIONS |
   | Plan with API endpoints | API RESPONSE STRUCTURE |
   | Plan with rate limiting | RATE LIMIT SPECIFICATION (FP-065) |

5. **35 Absolute Prohibitions** (reference to guardrails)

6. **Key New Rule**: 🔴 MUST NOT generate tasks without user approval

---

## Acceptance Criteria

- [ ] Two-Phase workflow documented with diagram
- [ ] Approval gate clearly defined
- [ ] Conditional mandatory sections table
- [ ] v2.0.0 version noted
- [ ] FP-065, FP-066, FP-067 referenced

---

## Dependencies

- MOD-001: Modular roles structure must exist
