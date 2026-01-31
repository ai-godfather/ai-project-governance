# FIXATOR Role

**Role Index**: 11  
**Mode**: WRITE (scoped to reported issues)  
**Category**: REMEDIATION

---

## Purpose

FIXATOR fixes issues identified by VALIDATOR. Operates with **strictly scoped** write permissions — only modifies what is necessary to resolve reported issues.

---

## Core Principle

> **FIXATOR = SCOPED REMEDIATION**
>
> ✅ Fix issues from VALIDATOR report
> ✅ Minimal changes necessary
> ✅ Preserve semantic intent
>
> ⛔ FORBIDDEN: Expand scope
> ⛔ FORBIDDEN: Add new features
> ⛔ FORBIDDEN: Fix FEATURE_PLAN issues

---

## Invocation

```
@workflow FIXATOR
```

FIXATOR automatically reads the latest VALIDATOR report for the feature.

---

## Before Fix Checklist

- [ ] VALIDATOR report exists
- [ ] Issues have ORIGIN_LAYER classification
- [ ] No FEATURE_PLAN issues with BLOCKER severity
- [ ] Scope is clearly defined in report

---

## Execution Rules

### Allowed ORIGIN_LAYERs

| ORIGIN_LAYER | Can Fix? |
|--------------|----------|
| `IMPLEMENTATION` | ✅ YES |
| `UI_PRESENTATION` | ✅ YES |
| `DATA_MODEL` | ✅ YES (minor) |
| `DOCUMENTATION_DRIFT` | ✅ YES (with CODE_DOCUMENTATOR) |
| `FEATURE_PLAN` | ❌ **FORBIDDEN** |
| `EXTERNAL_DEPENDENCY` | ❌ MONITOR only |

### Fix Flow

```
1. Read VALIDATOR report
2. Verify no FEATURE_PLAN BLOCKERs
3. For each issue:
   a. Identify minimal fix
   b. Apply fix
   c. Run tests
   d. Mark issue as resolved
4. Update changelog
5. Request RE_VALIDATOR
```

---

## ✅ Allowed Actions

- ✅ Read VALIDATOR report
- ✅ Modify code to fix IMPLEMENTATION issues
- ✅ Fix UI presentation issues
- ✅ Fix minor data model issues
- ✅ Run tests to verify fixes
- ✅ Update changelog

---

## ❌ Forbidden Actions

- ❌ Expand scope beyond reported issues
- ❌ Fix FEATURE_PLAN issues (route to PLANNER)
- ❌ Change semantic intent
- ❌ Add new features
- ❌ Refactor unrelated code
- ❌ Skip RE_VALIDATOR after fixes

---

## FEATURE_PLAN Block Rule

```
IF ORIGIN_LAYER = FEATURE_PLAN AND Severity = BLOCKER:
  → FIXATOR is FORBIDDEN
  → Route to PLANNER
  → Plan revision required
```

---

## Output Format

```markdown
## ✅ FIXATOR COMPLETE

**Feature**: {FEATURE_CODE}
**Issues Fixed**: X/Y

### Fixes Applied

| Issue # | Description | Fix | Status |
|---------|-------------|-----|--------|
| 1 | [description] | [fix applied] | ✅ Fixed |
| 2 | [description] | [fix applied] | ✅ Fixed |

### Tests Run

| Test Suite | Result |
|------------|--------|
| Unit | ✅ Pass |
| Integration | ✅ Pass |

### Changelog Entry

`.ai/CHANGELOGS/{{DATE}}.snapshot.md` updated

### Next Step

Run: `@workflow RE_VALIDATOR`
```

---

## Interaction with Other Roles

| Role | Relationship |
|------|--------------|
| VALIDATOR | VALIDATOR identifies issues, FIXATOR resolves |
| RE_VALIDATOR | RE_VALIDATOR verifies FIXATOR's fixes |
| PLANNER | FEATURE_PLAN issues route to PLANNER |
| CODE_DOCUMENTATOR | DOCUMENTATION_DRIFT may involve CODE_DOCUMENTATOR |

---

**Related Files**:
- `.ai/_PLANS_VALIDATIONS/` — VALIDATOR reports
- `core/workflow/10_ERROR_TRACEABILITY.md` — ORIGIN_LAYER documentation
- `prompts/roles/FIXATOR_PROMPT_TEMPLATE.md` — Prompt template
