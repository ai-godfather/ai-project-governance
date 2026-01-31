# Task: WDOC-006 — Update 08_COMMANDS.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 08_COMMANDS.md with new workflow commands for AUDITOR, TDD_GUIDE, and UI_BROWSER_INSPECTOR.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/08_COMMANDS.md`
- Read existing v1.0: `core/workflow/08_COMMANDS.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/08_COMMANDS.md`

### Content Requirements

1. **Add New Commands**:
   - `@workflow AUDITOR <FEATURE_CODE>` — Quality gate audit
   - `@workflow TDD_GUIDE <TASK_ID>` — Create failing tests (RED phase)
   - `@workflow UI_BROWSER_INSPECTOR <FEATURE_CODE>` — Generate E2E tests

2. **Update Command Reference Table**: 17 commands total

3. **Add Usage Examples** for new commands

---

## Acceptance Criteria

- [ ] AUDITOR command added
- [ ] TDD_GUIDE command added
- [ ] UI_BROWSER_INSPECTOR command added
- [ ] 17 commands documented
