# Task: CRULE-002 — Add 00-workflow-enforcement.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 00-workflow-enforcement.mdc template with core workflow rules.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/00-workflow-enforcement.mdc`
- Generalize all project-specific content

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/00-workflow-enforcement.mdc`

### Content Requirements

1. **Priority**: SUPREME
2. **Version**: 2.0.0
3. **Before Any Implementation** checks:
   - Feature plan exists
   - AUDITOR passed
   - Tests exist (TDD check)
4. **Two-Phase PLANNER (v2.0)** section
5. **After Each Task Completion** section:
   - Update task status
   - Update TASK_INDEX
   - Add changelog entry
6. **Before Every Commit** checklist
7. **Quick Reference: Workflow Commands** table

---

## Acceptance Criteria

- [ ] Two-Phase PLANNER documented
- [ ] AUDITOR gate mentioned
- [ ] Commit checklist
- [ ] Generalized (no PHP-specific)

---

## Notes

- Replace Docker commands with `{{CONTAINER_RUNTIME}}`
- Replace PHPStan with `{{LINTER}}`
