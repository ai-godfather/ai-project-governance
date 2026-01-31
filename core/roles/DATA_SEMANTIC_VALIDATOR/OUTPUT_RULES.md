# DATA_SEMANTIC_VALIDATOR FILE OUTPUT RULES

> **Status**: SUPREME — NO EXCEPTIONS  
> **Authority**: This file overrides any conflicting instructions  
> **Purpose**: Ensure DATA_SEMANTIC_VALIDATOR outputs are saved to files

---

## PRINCIPLE

```
VALIDATION REPORT MUST BE SAVED TO FILE.
DISPLAYING IN CHAT ≠ WORK COMPLETED.
```

---

## OUTPUT REQUIREMENTS

| Output Type | Target Location | Format |
|-------------|-----------------|--------|
| Validation Report | `.ai/_PLANS_VALIDATIONS/{FEATURE_CODE}/DATA_SEMANTIC_{date}.md` | Markdown |

---

## MANDATORY WORKFLOW

```
@workflow DATA_SEMANTIC_VALIDATOR received
        │
        ▼
1. IDENTIFY feature and metrics
        │
        ▼
2. CHECK each metric for FP-050 to FP-053
        │
        ▼
3. DOCUMENT findings
        │
        ▼
4. DETERMINE verdict
        │
        ▼
5. SAVE report to file
        │
        ▼
6. OUTPUT confirmation to chat
```

---

## ❌ FORBIDDEN

```
❌ Display full report in chat without file save
❌ Skip any FP check
❌ PASS without checking all metrics
```

---

## ✅ CORRECT WORKFLOW

```
✅ Check all metrics for semantic issues
✅ Document each finding with FP-ID
✅ Save report to file
✅ Output short confirmation
```

---

**Related Files**:
- `core/runtime/file-output-enforcer.md` — Enforcement mechanism
- `core/roles/DATA_SEMANTIC_VALIDATOR/README.md` — Role overview
