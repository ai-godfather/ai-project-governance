# Task: WDOC-003 — Update 05_FAILURE_PATTERNS.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 05_FAILURE_PATTERNS.md with FP-050 to FP-069 (Data Semantic and Process patterns).

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/05_FAILURE_PATTERNS.md`
- Read existing v1.0: `core/workflow/05_FAILURE_PATTERNS.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/05_FAILURE_PATTERNS.md`

### Content Requirements

1. **Update Summary Table**: Add new categories
   | Category | FP Range | Count | Detection Role |
   |----------|----------|-------|----------------|
   | DATA SEMANTIC | FP-050 to FP-056 | 7 | DATA_SEMANTIC_VALIDATOR |
   | PROCESS/WORKFLOW | FP-057 to FP-069 | 13 | AUDITOR, VALIDATOR, TDD_GUIDE |

2. **Add Data Semantic Patterns Section** (FP-050 to FP-056):
   - FP-050: Misleading Metric Label
   - FP-051: Undefined Success Criteria
   - FP-052: Sample Size Without Warning
   - FP-053: Data Source Ambiguity
   - FP-054: API Structure Undocumented
   - FP-055: Task File Incomplete Generation
   - FP-056: Implementation Status Drift

3. **Add Process Patterns Section** (FP-057 to FP-069):
   - FP-057: Service Interface Not Verified
   - FP-058: Graceful Degradation Missing
   - FP-059: External API Fallback Missing
   - FP-060: ASCII Mockup Not Mapped
   - FP-061: Long Prompt Partial Read
   - FP-062: Third-Party Library Config
   - FP-063: Missing Runtime Verification
   - FP-064: Plan References Non-Existent Field
   - FP-065: Rate Limit Not Implemented
   - FP-066: Migration Column Unused
   - FP-067: Inherited Issue Undocumented
   - FP-068: TASK_INDEX Status Mismatch
   - FP-069: Documentation Task Incomplete

4. **Add Project-Specific Pattern Template** section:
   - Template for FP-{PROJECT}-* patterns

---

## Acceptance Criteria

- [ ] FP-050 to FP-056 documented
- [ ] FP-057 to FP-069 documented
- [ ] Detection roles assigned
- [ ] Prevention methods listed
- [ ] Project-specific template added

---

## Dependencies

None (standalone update)
