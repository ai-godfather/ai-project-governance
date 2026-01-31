# Task: WDEF-006 — Add UI_BROWSER_INSPECTOR.workflow.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DEFINITIONS  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create UI_BROWSER_INSPECTOR.workflow.md for E2E test generation workflow.

---

## Input Requirements

- Read callrelay source: `.ai/workflows/UI_BROWSER_INSPECTOR.workflow.md`

---

## Output Requirements

### Files to Create

1. `core/workflows/UI_BROWSER_INSPECTOR.workflow.md`

### Content Requirements

1. **Workflow Name**: E2E Test Generation
2. **Trigger**: `@workflow UI_BROWSER_INSPECTOR <FEATURE_CODE>`
3. **Steps**:
   - Locate feature plan
   - Detect test framework (Puppeteer/Playwright)
   - Analyze UI components
   - Generate test file(s)
   - Run tests to verify
   - Output report
4. **Test Categories** to generate
5. **Framework Detection** mandatory
6. **Output Artifacts**: Test files, optional report

---

## Acceptance Criteria

- [ ] Framework detection step
- [ ] Test categories listed
- [ ] Output file naming patterns
- [ ] Generalized (Puppeteer OR Playwright)
