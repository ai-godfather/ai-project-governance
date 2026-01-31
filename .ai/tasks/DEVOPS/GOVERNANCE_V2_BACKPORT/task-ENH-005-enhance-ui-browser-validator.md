# Task: ENH-005 — Enhance UI_BROWSER_VALIDATOR v3.0

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: ROLE_ENHANCEMENTS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Enhance the UI_BROWSER_VALIDATOR role with Puppeteer enforcement and database-driven testing (v3.0).

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (UI_BROWSER_VALIDATOR section)
- Read callrelay cursor rule: `.cursor/rules/06-ui-browser-validator-enforcement.mdc`
- Read existing v1.0: `core/workflow/03_ROLES.md` (UI_BROWSER_VALIDATOR)

---

## Output Requirements

### Files to Modify/Create

1. `core/roles/UI_BROWSER_VALIDATOR/README.md` — Enhanced role documentation

### Content Requirements (New Sections)

1. **Version**: 3.0.0 (Puppeteer Enforcement)

2. **Tooling Change**:
   - Primary: Browser automation (Puppeteer/Playwright)
   - Supplementary: MCP browser (visual checks only)

3. **🔴 CRITICAL: Automation Tests Required**:
   ```
   ❌ MCP browser ALONE is NOT sufficient
   ✅ MUST run E2E tests from test directory
   ✅ MCP browser is SUPPLEMENTARY only
   ```

4. **Mandatory Workflow**:
   1. Search for tests
   2. If tests exist → RUN THEM
   3. If no tests → Output: "Run UI_BROWSER_INSPECTOR first"
   4. Parse results
   5. Supplementary visual checks
   6. Generate report with verdict

5. **Enhanced Verdicts**:
   | Verdict | Condition |
   |---------|-----------|
   | ✅ PASS | 100% tests pass |
   | ⚠️ PARTIAL | 90-99% pass |
   | ❌ FAIL | <90% pass |
   | 🚫 BLOCKED | Cannot execute |
   | 🆕 NO_TESTS | Tests don't exist |

6. **Database-Driven Testing** (for forms/filters):
   - Query real data before testing
   - Verify filters find correct records
   - Compare UI results with database

---

## Acceptance Criteria

- [ ] v3.0.0 version noted
- [ ] Puppeteer/Playwright enforcement documented
- [ ] Enhanced verdicts table
- [ ] Database-driven testing explained
- [ ] Generalized (no PHP-specific)

---

## Dependencies

- MOD-001: Modular roles structure must exist
