# Task: CRULE-008 — Add 06-ui-browser-validator-enforcement.mdc

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create 06-ui-browser-validator-enforcement.mdc template for E2E testing rules.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/06-ui-browser-validator-enforcement.mdc`

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/06-ui-browser-validator-enforcement.mdc`

### Content Requirements

1. **Priority**: CRITICAL
2. **Problem Statement**: MCP browser alone is insufficient
3. **Mandatory Workflow**:
   - Step 1: Check for existing tests
   - Step 2: Run existing tests OR create new
   - Step 3: Parse results
   - Step 4: MCP browser for ADDITIONAL visual checks only
4. **Required Test Coverage** categories:
   - CORE tests (always required)
   - CRUD tests (for entity features)
   - Interactive Form tests
   - API tests
   - State tests
5. **What is NOT Acceptable** list
6. **Required Output Format** template
7. **Verdicts** table:
   - PASS, PARTIAL, FAIL, BLOCKED, NO_TESTS
8. **MCP Browser Usage**: Allowed vs Not Allowed
9. **Database-Driven Testing** (v3.0):
   - Query DB for sample records
   - Test filters with real data
   - Verify results match DB

---

## Acceptance Criteria

- [ ] Puppeteer enforcement documented
- [ ] MCP browser role clarified (supplementary only)
- [ ] Database-driven testing section
- [ ] Verdict criteria
- [ ] Generalized (no PHP-specific)
