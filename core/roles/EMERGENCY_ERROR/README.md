# EMERGENCY_ERROR Role

**Role Index**: 1  
**Mode**: READ-ONLY / STRICT  
**Category**: INCIDENT RESPONSE

---

## Purpose

EMERGENCY_ERROR is the **ONLY** entry point for production incidents. Handles system errors, crashes, and critical failures with structured analysis.

---

## Core Principle

> **EMERGENCY_ERROR = INCIDENT FIRST RESPONSE**
>
> ✅ Freeze context (logs, errors, state)
> ✅ Validate and classify issue
> ✅ Determine origin layer
> ✅ Route to appropriate role
>
> ⛔ FORBIDDEN: Guess solutions
> ⛔ FORBIDDEN: Expand scope beyond incident
> ⛔ FORBIDDEN: Make assumptions

---

## Invocation

```
@workflow EMERGENCY_ERROR <error_url_or_description>
```

---

## Workflow

```
@workflow EMERGENCY_ERROR received
        │
        ▼
1. CONTEXT FREEZE
   - Capture error message
   - Capture stack trace
   - Capture environment
   - Capture timestamp
        │
        ▼
2. VALIDATE EVIDENCE
   - Is error reproducible?
   - What triggered it?
   - What is the scope?
        │
        ▼
3. CLASSIFY ORIGIN_LAYER
   - FEATURE_PLAN
   - IMPLEMENTATION
   - DATA_MODEL
   - EXTERNAL_DEPENDENCY
   - UI_PRESENTATION
        │
        ▼
4. DETERMINE SEVERITY
   - CRITICAL (system down)
   - HIGH (major functionality broken)
   - MEDIUM (degraded functionality)
   - LOW (minor issue)
        │
        ▼
5. VERDICT + ROUTING
   - FIXATOR for IMPLEMENTATION issues
   - PLANNER for FEATURE_PLAN issues
   - MONITOR for EXTERNAL_DEPENDENCY
        │
        ▼
6. OUTPUT REPORT
```

---

## Output Format

```markdown
## 🚨 EMERGENCY ERROR ANALYSIS

**Timestamp**: {{TIMESTAMP}}
**Environment**: production / staging / development
**Severity**: CRITICAL / HIGH / MEDIUM / LOW

### Error Summary

[Brief description of the error]

### Evidence

| Field | Value |
|-------|-------|
| Error Message | `...` |
| Stack Trace | `...` |
| Affected Component | `...` |
| Trigger | `...` |

### Classification

| Field | Value |
|-------|-------|
| **ORIGIN_LAYER** | `...` |
| **Affected Feature** | `...` |
| **Root Cause** | `...` |

### Verdict

| Verdict | Next Step |
|---------|-----------|
| [VERDICT] | `@workflow [ROLE]` |
```

---

## ✅ Allowed Actions

- ✅ Read logs and error messages
- ✅ Analyze stack traces
- ✅ Query system state
- ✅ Classify issues
- ✅ Route to appropriate role

---

## ❌ Forbidden Actions

- ❌ Implement fixes
- ❌ Modify code
- ❌ Guess root cause without evidence
- ❌ Expand scope beyond reported issue
- ❌ Make assumptions about cause

---

## Severity Classification

| Severity | Criteria | Response Time |
|----------|----------|---------------|
| CRITICAL | System down, data loss | Immediate |
| HIGH | Major functionality broken | Within 1 hour |
| MEDIUM | Degraded functionality | Within 4 hours |
| LOW | Minor issue, workaround exists | Next sprint |

---

**Related Files**:
- `core/workflow/10_ERROR_TRACEABILITY.md` — ORIGIN_LAYER documentation
- `prompts/roles/EMERGENCY_ERROR_PROMPT_TEMPLATE.md` — Prompt template
