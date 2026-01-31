# Task: FP-001 — Add Data Semantic Patterns (FP-050 to FP-056)

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: FAILURE_PATTERNS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Add 7 new Data Semantic failure patterns to 05_FAILURE_PATTERNS.md.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/05_FAILURE_PATTERNS.md` (FP-050 to FP-056 section)

---

## Output Requirements

### Files to Modify

1. `core/workflow/05_FAILURE_PATTERNS.md`

### Patterns to Add

| FP-ID | Pattern | Detection | Prevention |
|-------|---------|-----------|------------|
| FP-050 | Misleading Metric Label | DATA_SEMANTIC | Tooltip with exact calculation |
| FP-051 | Undefined Success Criteria | DATA_SEMANTIC | Explicit status list |
| FP-052 | Sample Size Without Warning | DATA_SEMANTIC | Show ⚠️ when n < 30 |
| FP-053 | Data Source Ambiguity | DATA_SEMANTIC | Specify table.column |
| FP-054 | API Structure Undocumented | TDD_GUIDE | JSON example per endpoint |
| FP-055 | Task File Incomplete Generation | AUDITOR | Verify count: planned = generated |
| FP-056 | Implementation Status Drift | VALIDATOR | Immediate status update |

---

## Acceptance Criteria

- [ ] All 7 patterns added
- [ ] Detection role assigned
- [ ] Prevention method documented
- [ ] ORIGIN_LAYER mapping added

---

## Dependencies

None
