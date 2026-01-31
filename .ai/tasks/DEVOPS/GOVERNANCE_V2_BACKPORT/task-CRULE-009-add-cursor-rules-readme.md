# Task: CRULE-009 — Add Cursor Rules README.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create comprehensive README.md for adapters/cursor-rules/ with installation guide.

---

## Output Requirements

### Files to Update

1. `adapters/cursor-rules/README.md`

### Content Requirements

1. **Purpose**: Cursor IDE enforcement rules
2. **File Index**:
   | File | Purpose | Priority |
   |------|---------|----------|
   | 00-workflow-enforcement.mdc | Core workflow rules | CRITICAL |
   | 01-blocking-conditions.mdc | BLOCK conditions | CRITICAL |
   | 02-pre-commit-checklist.mdc | Commit requirements | HIGH |
   | 03-failure-patterns-critical.mdc | Critical FPs | HIGH |
   | 04-role-boundaries.mdc | Role permissions | HIGH |
   | 05-project-context.mdc.template | Project context | CUSTOMIZE |
   | 06-ui-browser-validator-enforcement.mdc | E2E rules | HIGH |
3. **Installation**:
   - Bootstrap copies to `.cursor/rules/`
   - Manual: `cp adapters/cursor-rules/*.mdc .cursor/rules/`
4. **Customization**:
   - Only customize 05-project-context.mdc
   - Others are framework-managed
5. **Toggle Configuration** in governance.config.yaml

---

## Acceptance Criteria

- [ ] All 7 files indexed
- [ ] Installation instructions
- [ ] Customization guide
- [ ] Toggle configuration reference
