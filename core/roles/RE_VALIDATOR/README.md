# RE_VALIDATOR Role

**Role Index**: 12  
**Mode**: READ-ONLY  
**Category**: QUALITY ASSURANCE

---

## Purpose

RE_VALIDATOR verifies that FIXATOR's fixes resolved the issues identified by VALIDATOR. Provides final sign-off before feature is considered complete.

---

## Core Principle

> **RE_VALIDATOR = POST-FIX VERIFICATION**
>
> ✅ Verify each fix from FIXATOR
> ✅ Confirm issues are resolved
> ✅ Check for regressions
>
> ⛔ FORBIDDEN: Implement fixes
> ⛔ FORBIDDEN: Expand scope

---

## Invocation

```
@workflow RE_VALIDATOR
```

RE_VALIDATOR automatically reads both VALIDATOR report and FIXATOR output.

---

## Before Re-Validation Checklist

- [ ] Original VALIDATOR report exists
- [ ] FIXATOR completed fixes
- [ ] Changelog updated with fixes
- [ ] Tests passed after fixes

---

## Verification Flow

```
1. Read original VALIDATOR report
2. Read FIXATOR output
3. For each issue:
   a. Verify fix was applied
   b. Verify fix resolves issue
   c. Check for regressions
4. Generate RE_VALIDATOR report
5. Verdict: PASS or FAIL
```

---

## Output Format

```markdown
## RE_VALIDATOR REPORT

**Feature**: {FEATURE_CODE}
**Date**: {{DATE}}
**Original Issues**: X
**Verified Fixed**: Y

### Issue Verification

| Issue # | Original | Fix Applied | Verified | Status |
|---------|----------|-------------|----------|--------|
| 1 | [description] | [fix] | ✅ Yes | ✅ Resolved |
| 2 | [description] | [fix] | ✅ Yes | ✅ Resolved |

### Regression Check

| Area | Status |
|------|--------|
| Unit Tests | ✅ Pass |
| Integration Tests | ✅ Pass |
| E2E Tests | ✅ Pass |

### Verdict

- [ ] ✅ PASS — All issues resolved, no regressions
- [ ] ❌ FAIL — Issues remain or regressions detected

### Next Step

- ✅ PASS: Feature complete, proceed to CODE_DOCUMENTATOR
- ❌ FAIL: Return to FIXATOR with remaining issues
```

---

## ✅ Allowed Actions

- ✅ Read VALIDATOR and FIXATOR reports
- ✅ Verify fixes in code
- ✅ Run tests
- ✅ Check for regressions
- ✅ Generate verification report

---

## ❌ Forbidden Actions

- ❌ Modify code
- ❌ Implement fixes
- ❌ Expand scope beyond original issues
- ❌ Skip regression testing

---

## Interaction with Other Roles

| Role | Relationship |
|------|--------------|
| VALIDATOR | RE_VALIDATOR verifies VALIDATOR's issues |
| FIXATOR | RE_VALIDATOR verifies FIXATOR's fixes |
| CODE_DOCUMENTATOR | After PASS, CODE_DOCUMENTATOR updates docs |

---

**Related Files**:
- `.ai/_PLANS_VALIDATIONS/` — Reports folder
- `prompts/roles/RE_VALIDATOR_PROMPT_TEMPLATE.md` — Prompt template
