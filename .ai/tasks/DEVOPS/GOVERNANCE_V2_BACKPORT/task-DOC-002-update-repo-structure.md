# Task: DOC-002 — Update REPO_STRUCTURE.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: DOCUMENTATION  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update REPO_STRUCTURE.md with new directories.

---

## Input Requirements

- Read existing: `REPO_STRUCTURE.md`

---

## Output Requirements

### Files to Modify

1. `REPO_STRUCTURE.md`

### Content Updates

1. **Add to Directory Layout**:
   ```
   ├── adapters/
   │   ├── cursor-rules/           # NEW: Cursor IDE enforcement
   │   │   ├── 00-workflow-enforcement.mdc
   │   │   ├── 01-blocking-conditions.mdc
   │   │   ├── ...
   │   │   └── README.md
   │   └── ...
   │
   ├── core/
   │   ├── workflows/               # NEW: Executable workflow definitions
   │   │   ├── PLANNER.workflow.md
   │   │   ├── AUDITOR.workflow.md
   │   │   ├── ...
   │   │   └── documentation/
   │   │
   │   ├── roles/                   # RESTRUCTURED: Modular folders
   │   │   ├── AUDITOR/            # NEW
   │   │   ├── TDD_GUIDE/          # NEW
   │   │   ├── UI_BROWSER_INSPECTOR/ # NEW
   │   │   ├── PLANNER/
   │   │   │   ├── README.md
   │   │   │   └── OUTPUT_RULES.md
   │   │   └── ...
   │   │
   │   └── workflow/
   │       ├── 07_TROUBLESHOOTING.md  # NEW
   │       └── 11_HOOKS.md            # NEW
   ```

2. **Update Directory Purposes**:
   - Add `/adapters/cursor-rules/`
   - Add `/core/workflows/`
   - Update `/core/roles/` description

3. **Update Installation Targets** table

---

## Acceptance Criteria

- [ ] New directories shown
- [ ] New files listed
- [ ] Purposes explained
- [ ] Installation targets updated
