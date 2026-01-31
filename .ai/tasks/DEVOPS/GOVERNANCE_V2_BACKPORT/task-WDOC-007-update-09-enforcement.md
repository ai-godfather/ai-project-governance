# Task: WDOC-007 — Update 09_ENFORCEMENT.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Update 09_ENFORCEMENT.md with file output enforcement rules.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/09_ENFORCEMENT.md`
- Read callrelay runtime: `.ai/runtime/file-output-enforcer.md`
- Read existing v1.0: `core/workflow/09_ENFORCEMENT.md`

---

## Output Requirements

### Files to Modify

1. `core/workflow/09_ENFORCEMENT.md`

### Content Requirements

1. **Add File Output Enforcement Section**:
   - Enforcement Matrix (which roles must create files)
   - Target Locations table
   - Validation Steps
   - Common Violations

2. **Reference to**:
   - `.ai/runtime/file-output-enforcer.md`
   - Role-specific OUTPUT_RULES.md files

---

## Acceptance Criteria

- [ ] File Output Enforcement section added
- [ ] Enforcement Matrix included
- [ ] References to runtime guards
