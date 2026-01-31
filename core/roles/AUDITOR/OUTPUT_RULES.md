# AUDITOR FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure all AUDITOR outputs are saved to files, not displayed in chat

---

## PRINCIPLE

```
AUDITOR REPORT MUST BE SAVED TO FILE.
DISPLAYING IN CHAT ≠ WORK COMPLETED.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| Audit Report | `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/PLANNER_AUDIT_{YYYY-MM-DD}.md` | Markdown |

---

## MANDATORY WORKFLOW

```
@workflow AUDITOR received
        │
        ▼
1. RESOLVE feature code + locate plan
        │
        ▼
2. LOCATE task files
        │
        ▼
3. EXECUTE 15-dimension audit
        │
        ▼
4. DETERMINE verdict (PASS / PARTIAL / FAIL)
   │
   ├─ BLOCKING issues → ❌ FAIL
   │     Return to PLANNER for corrections
   │
   └─ Non-blocking issues → ⚠️ PARTIAL or ✅ PASS
        │
        ▼
5. CREATE report folder if needed
        │
        ▼
6. WRITE audit report to file (NOT chat)
        │
        ▼
7. OUTPUT confirmation (short) to chat
```

---

## FILE PATH TEMPLATE

```
.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/PLANNER_AUDIT_{YYYY-MM-DD}.md

Examples:
- .ai/_PLANS_VALIDATIONS/ADMIN_001/PLANNER_AUDIT_2026-01-28.md
- .ai/_PLANS_VALIDATIONS/FEATURE_V2/PLANNER_AUDIT_2026-01-29.md
```

---

## ❌ FORBIDDEN

```
❌ Display full audit report in chat first, then "also save to file"
❌ Ask user "should I save this?"
❌ Show audit in chat without file creation
❌ Create audit as code block in chat
❌ Use placeholder paths without actual file creation
```

---

## ✅ CORRECT WORKFLOW

```
✅ Write audit report directly to file using Write tool
✅ Display only: "Audit saved to: .ai/_PLANS_VALIDATIONS/{CODE}/PLANNER_AUDIT_{date}.md"
✅ Include verdict summary in chat confirmation
✅ Include next step recommendation
```

---

## CHAT OUTPUT FORMAT

After audit completion, AUDITOR outputs **ONLY** this to chat:

```markdown
## ✅ AUDIT COMPLETE

**Feature**: {FEATURE_CODE}
**Verdict**: ✅ PASS / ⚠️ PARTIAL / ❌ FAIL

### Summary

{2-3 sentence summary of audit findings}

### Files Created

| File | Path | Status |
|------|------|--------|
| Audit Report | `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/PLANNER_AUDIT_{date}.md` | ✅ Created |

### Coverage

- **Plan Elements**: {covered}/{total} ({percentage}%)
- **Critical Findings**: {count}
- **Non-Blocking Issues**: {count}

### Next Step

- ✅ PASS: Run `@workflow IMPLEMENTER {FEATURE_CODE}`
- ⚠️ PARTIAL: PLANNER fixes tasks → `@workflow AUDITOR {FEATURE_CODE}`
- ❌ FAIL: PLANNER regenerates tasks → `@workflow AUDITOR {FEATURE_CODE}`
```

---

## ENFORCEMENT MECHANISM

### Step 1: BEFORE Action

```
1. Read this OUTPUT_RULES.md
2. Resolve FEATURE_CODE
3. Locate plan file and task folder
4. Calculate target report path
5. Confirm paths are valid
```

### Step 2: DURING Action

```
1. Execute 15-dimension audit
2. Build coverage matrix
3. Identify critical findings
4. Determine verdict
5. Use Write tool to create audit report
6. DO NOT display full report in chat
```

### Step 3: AFTER Action

```
1. Confirm report file created
2. Output short confirmation to chat
3. Include verdict and coverage summary
4. Include "Next Step" recommendation
```

---

## VALIDATION CHECKLIST

Before completing AUDITOR session:

- [ ] Audit report file exists in `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/`
- [ ] Report contains all 15 audit dimensions
- [ ] Report contains coverage matrix
- [ ] Report contains executive verdict
- [ ] Report contains final recommendation
- [ ] Chat output is confirmation only (not full report)
- [ ] Next step is clearly stated

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/AUDITOR/README.md` — Role overview
- `prompts/roles/AUDITOR_PROMPT_TEMPLATE.md` — Prompt template
