# Task: CRULE-004 — Add 02-pre-commit-checklist.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 02-pre-commit-checklist.mdc template with commit requirements.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/02-pre-commit-checklist.mdc`

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/02-pre-commit-checklist.mdc`

### Content Requirements

1. **When**: Before EVERY commit
2. **Who**: IMPLEMENTER, FIXATOR
3. **Step 1: Code Quality Checks**:
   - Linter: `{{LINTER_COMMAND}}`
   - Container/Service validation (if applicable)
   - Template validation (if applicable)
4. **Step 2: Task Status Verification**:
   - Task file status = completed
   - TASK_INDEX updated
5. **Step 3: Changelog Entry**:
   - Verify today's changelog exists
   - Entry format template
6. **Step 4: Commit Message Format**:
   - Conventional Commits
   - Types: feat, fix, docs, refactor, test, chore
7. **Commit Checklist** (checkboxes)
8. **Never Commit If** section
9. **Quick Commit Flow** commands

---

## Acceptance Criteria

- [ ] All steps parameterized
- [ ] Conventional Commits explained
- [ ] Checklist format
- [ ] No hardcoded commands
