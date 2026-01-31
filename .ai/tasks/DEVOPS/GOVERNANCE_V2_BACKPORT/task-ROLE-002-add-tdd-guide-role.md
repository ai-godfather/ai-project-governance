# Task: ROLE-002 — Add TDD_GUIDE Role

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CORE_ROLES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create the TDD_GUIDE role for RED phase test creation. TDD_GUIDE creates failing tests before implementation, ensuring Test-Driven Development workflow.

---

## Input Requirements

- Read callrelay source: `.ai/roles/TDD_GUIDE/README.md`
- Read callrelay source: `.ai/_WORKFLOW/03_ROLES.md` (TDD_GUIDE section)
- Understand 6 FP-TDD patterns

---

## Output Requirements

### Files to Create

1. `core/roles/TDD_GUIDE/README.md` — Full role documentation

### Content Requirements

The TDD_GUIDE README.md must include:

1. **Purpose**: Create failing tests (RED phase) before implementation
2. **Mode**: WRITE (scoped to `tests/` only)
3. **Command**: `@workflow TDD_GUIDE <TASK_ID>`
4. **Core Principle**: "TDD_GUIDE = RED PHASE ONLY"
5. **Workflow Position**: PLANNER → AUDITOR → [TDD_GUIDE] → IMPLEMENTER
6. **Guardrails (6 FP-TDD patterns)**:
   - FP-TDD-001: Entity Type Analysis
   - FP-TDD-002: Controller Pattern Analysis
   - FP-TDD-003: Authentication Behavior Analysis
   - FP-TDD-004: Response Structure Contract
   - FP-TDD-005: API Schema Missing (blocking)
   - FP-TDD-006: Service Method Contract Verification
7. **Pre-Test Checklist** table
8. **Pre-Flight Block Conditions**
9. **Test Categories** table (what to test, what to skip)
10. **Output Format** template
11. **Common Mistakes to Avoid** table
12. **Scope Lock**: tests only, implementation FORBIDDEN
13. **Output Location**: `.ai/_PLANS_VALIDATIONS/{FEATURE}/TDD_GUIDE_REPORT_{date}.md`

---

## Acceptance Criteria

- [ ] `core/roles/TDD_GUIDE/README.md` exists
- [ ] All 6 FP-TDD patterns documented
- [ ] Pre-Flight Block Conditions defined
- [ ] Workflow position diagram
- [ ] Scope lock clearly defined (tests only)
- [ ] Output format template included
- [ ] Generalized (parameterized test framework: `{{TEST_FRAMEWORK}}`)

---

## Dependencies

- MOD-001: Modular roles structure must exist

---

## Notes

- Source: `/Users/pt/Sites/callbotagent.ai/callbotagent-callrelay/.ai/roles/TDD_GUIDE/README.md`
- Replace `PHPUnit` with `{{TEST_FRAMEWORK}}`
- Replace `vendor/bin/phpunit` with `{{TEST_COMMAND}}`
