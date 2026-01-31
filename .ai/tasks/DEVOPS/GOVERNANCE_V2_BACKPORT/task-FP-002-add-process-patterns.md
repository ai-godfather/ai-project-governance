# Task: FP-002 — Add Process Patterns (FP-057 to FP-069)

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: FAILURE_PATTERNS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Add 13 new Process/Workflow failure patterns to 05_FAILURE_PATTERNS.md.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/05_FAILURE_PATTERNS.md` (FP-057 to FP-069 section)

---

## Output Requirements

### Files to Modify

1. `core/workflow/05_FAILURE_PATTERNS.md`

### Patterns to Add

| FP-ID | Pattern | Detection | Prevention |
|-------|---------|-----------|------------|
| FP-057 | Service Interface Not Verified | AUDITOR | SERVICE INTERFACE VERIFICATION |
| FP-058 | Graceful Degradation Missing | DATA_SEMANTIC | GRACEFUL DEGRADATION section |
| FP-059 | External API Fallback Missing | DATA_SEMANTIC | EXTERNAL API FALLBACK section |
| FP-060 | ASCII Mockup Not Mapped | AUDITOR | ASCII MOCKUP COVERAGE table |
| FP-061 | Long Prompt Partial Read | PLANNER | LONG PROMPT VERIFICATION |
| FP-062 | Third-Party Library Config | VALIDATOR | Library config in plan |
| FP-063 | Missing Runtime Verification | VALIDATOR | E2E test requirement |
| FP-064 | Plan References Non-Existent Field | AUDITOR | Verify entity before referencing |
| FP-065 | Rate Limit Not Implemented | VALIDATOR | Require task |
| FP-066 | Migration Column Unused | AUDITOR | MIGRATION COLUMN USAGE MAP |
| FP-067 | Inherited Issue Undocumented | AUDITOR | PREDECESSOR FEATURE ANALYSIS |
| FP-068 | TASK_INDEX Status Mismatch | VALIDATOR | Immediate status updates |
| FP-069 | Documentation Task Incomplete | VALIDATOR | Block until docs complete |

---

## Acceptance Criteria

- [ ] All 13 patterns added
- [ ] Detection role assigned
- [ ] Prevention method documented
- [ ] ORIGIN_LAYER mapping added

---

## Dependencies

None
