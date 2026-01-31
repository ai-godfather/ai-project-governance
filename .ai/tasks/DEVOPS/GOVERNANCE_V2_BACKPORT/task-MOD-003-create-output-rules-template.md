# Task: MOD-003 — Create OUTPUT_RULES.md Template

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create standard OUTPUT_RULES.md template for roles that create files.

---

## Output Requirements

### Template Structure

```markdown
# {ROLE_NAME} Output Rules

> **Version**: 1.0.0  
> **Status**: ENFORCEMENT ACTIVE

---

## Mandatory Output Files

| Output Type | Location |
|-------------|----------|
| {type} | {path pattern} |

---

## Report Structure

{Required sections in output file}

---

## Forbidden

- ❌ Chat-only output
- ❌ Summary without file save
- ❌ {role-specific forbidden}

---

## Validation

{How to verify output was created}
```

---

## Acceptance Criteria

- [ ] Template created
- [ ] Applies to roles: PLANNER, AUDITOR, TDD_GUIDE, VALIDATOR, FIXATOR, RE_VALIDATOR, DATA_SEMANTIC_VALIDATOR, UI_BROWSER_VALIDATOR, UI_BROWSER_INSPECTOR, DOC_GUARD
