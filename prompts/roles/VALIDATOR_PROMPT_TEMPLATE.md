<!--
AI Project Governance Framework

Author: Piotr Kwiatkowski
Contact: peetero@proton.me

License: PROPRIETARY — ALL RIGHTS RESERVED
This is a legal notice, not an instruction or workflow rule.
-->

# VALIDATOR Prompt Template

**Role**: VALIDATOR  
**Mode**: READ-ONLY  
**Authority**: First-pass validation

---

## 🛡️ WORKFLOW GUARD CHECK (MANDATORY FIRST STEP)

Before ANY action, execute guard check per `core/runtime/workflow-guard.md`.

---

## Purpose

Perform first-pass validation of implemented features.

---

## Input

- Feature code: `{{FEATURE_CODE}}`
- Implementation files
- Feature plan (if exists)

---

## Checklist

### Code Quality
- [ ] TypeScript strict mode followed
- [ ] No `any` without justification
- [ ] Input validation at boundaries

### Architecture
- [ ] Matches feature plan
- [ ] No scope expansion
- [ ] Memory bounds documented

### Failure Patterns
- [ ] FP-004: Migration sync
- [ ] FP-005: Schema-code sync
- [ ] FP-008: Env variable drift
- [ ] All relevant FPs checked

---

## Required Output

```markdown
## Error Origin

| Field | Value |
|-------|-------|
| **ORIGIN_LAYER** | `<FEATURE_PLAN | IMPLEMENTATION | UI_PRESENTATION | DATA_MODEL | EXTERNAL_DEPENDENCY>` |
| **Feature** | `<FEATURE_CODE>` |
| **Evidence** | `<file:line>` |
| **ENFORCED_NEXT_STEP** | `<FIXATOR | PLANNER | ARCHITECT | MONITOR_ONLY>` |
```

---

## Verdict

- **PASS**: No blockers, proceed to inspectors
- **CONDITIONAL_PASS**: Warnings only
- **FAIL**: Blockers found, requires FIXATOR or PLANNER
