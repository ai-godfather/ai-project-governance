# Task: BOOT-002 — Update validate.sh for v2.0

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: BOOTSTRAP  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update validate.sh to verify v2.0 structure.

---

## Input Requirements

- Read existing: `bootstrap/scripts/validate.sh`

---

## Output Requirements

### Files to Modify

1. `bootstrap/scripts/validate.sh`

### Validation Checks to Add

1. **Cursor Rules Check**:
   ```bash
   check_file ".cursor/rules/00-workflow-enforcement.mdc"
   check_file ".cursor/rules/01-blocking-conditions.mdc"
   # ... all 6 MDC files
   ```

2. **Workflows Check**:
   ```bash
   check_dir ".ai/workflows"
   check_file ".ai/workflows/PLANNER.workflow.md"
   # ... key workflow files
   ```

3. **Modular Roles Check**:
   ```bash
   check_dir ".ai/roles/PLANNER"
   check_dir ".ai/roles/AUDITOR"
   check_dir ".ai/roles/TDD_GUIDE"
   # ... all 16 role folders
   ```

4. **Placeholder Check** for new files

---

## Acceptance Criteria

- [ ] Cursor rules validation
- [ ] Workflows validation
- [ ] Modular roles validation
- [ ] Placeholder verification
