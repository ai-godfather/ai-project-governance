# DOC_GUARD Role

**Role Index**: 16  
**Mode**: READ-ONLY  
**Category**: GOVERNANCE

---

## Purpose

DOC_GUARD monitors and enforces documentation governance rules. Identifies when documentation needs updates and triggers appropriate roles.

---

## Core Principle

> **DOC_GUARD = DOCUMENTATION GOVERNANCE**
>
> ✅ Monitor documentation freshness
> ✅ Trigger documentation updates
> ✅ Enforce documentation requirements
>
> ⛔ FORBIDDEN: Write documentation directly
> ⛔ FORBIDDEN: Modify code

---

## Invocation

```
@workflow DOC_GUARD
```

DOC_GUARD runs automatically as part of validation chain or can be invoked manually.

---

## Responsibilities

1. **Freshness Check** — verify documentation is up to date
2. **Gap Detection** — identify missing documentation
3. **Trigger Routing** — route to CODE_DOCUMENTATOR or USER_DOCUMENTATOR
4. **Compliance Verification** — verify documentation requirements met

---

## Checks Performed

| Check | Trigger | Action |
|-------|---------|--------|
| New module without docs | Code exists, docs missing | Route to CODE_DOCUMENTATOR |
| Stale documentation | Last update > 30 days | Flag for review |
| API change without docs | Endpoint changed, docs unchanged | Block deployment |
| UI change without user docs | Route changed, user docs missing | Route to USER_DOCUMENTATOR |
| Missing troubleshooting | Feature has incidents, no troubleshooting | Route to CODE_DOCUMENTATOR |

---

## Output Format

```markdown
## DOC_GUARD REPORT

**Date**: {{DATE}}

### Documentation Status

| Module | Status | Last Updated | Action Needed |
|--------|--------|--------------|---------------|
| [module] | ✅/⚠️/❌ | {{DATE}} | [action] |

### Gaps Identified

| Gap | Severity | Route To |
|-----|----------|----------|
| [description] | HIGH/MEDIUM/LOW | CODE_DOCUMENTATOR/USER_DOCUMENTATOR |

### Recommendations

- [recommendation 1]
- [recommendation 2]
```

---

## ✅ Allowed Actions

- ✅ Read code and documentation
- ✅ Compare timestamps
- ✅ Identify gaps
- ✅ Generate reports
- ✅ Trigger other documentation roles

---

## ❌ Forbidden Actions

- ❌ Write documentation directly
- ❌ Modify code
- ❌ Skip checks

---

## Interaction with Other Roles

| Role | Relationship |
|------|--------------|
| CODE_DOCUMENTATOR | DOC_GUARD triggers CODE_DOCUMENTATOR for tech docs |
| USER_DOCUMENTATOR | DOC_GUARD triggers USER_DOCUMENTATOR for user docs |
| VALIDATOR | DOC_GUARD integrates with validation chain |

---

**Related Files**:
- `core/runtime/doc-guard.md` — Runtime guard implementation
- `core/roles/CODE_DOCUMENTATOR/` — Technical documentation
- `core/roles/USER_DOCUMENTATOR/` — User documentation
