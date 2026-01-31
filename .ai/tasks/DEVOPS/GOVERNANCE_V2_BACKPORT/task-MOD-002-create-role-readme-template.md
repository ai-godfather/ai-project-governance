# Task: MOD-002 — Create Role README.md Template

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: MODULAR_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create standard README.md template for role folders.

---

## Output Requirements

### Template Structure

```markdown
# {ROLE_NAME} Role

**Role Index**: {N}  
**Mode**: {MODE}  
**Category**: {CATEGORY}

---

## Purpose

{1-2 sentence purpose}

---

## Invocation

\`\`\`
@workflow {ROLE_NAME} {ARGS}
\`\`\`

---

## Input / Output

| Aspect | Value |
|--------|-------|
| **Input** | {input} |
| **Output** | {output location} |

---

## Core Rules

{Role-specific rules}

---

## ✅ Allowed Actions

- ✅ {action}

---

## ❌ Forbidden Actions

- ❌ {action}

---

## Implementation Authority

| Role | Can Implement? |
|------|----------------|
| {ROLE_NAME} | {YES/NO} |

---

## Related Files

- {links}
```

---

## Acceptance Criteria

- [ ] Template created
- [ ] All sections documented
- [ ] Consistent with existing role READMEs
