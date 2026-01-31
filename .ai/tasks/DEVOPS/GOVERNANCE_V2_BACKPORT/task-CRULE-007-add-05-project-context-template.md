# Task: CRULE-007 — Add 05-project-context.mdc.template

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CURSOR_RULES  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Create 05-project-context.mdc.template for project-specific context with placeholders.

---

## Input Requirements

- Read callrelay source: `.cursor/rules/05-callrelay-context.mdc`
- Abstract to template with placeholders

---

## Output Requirements

### Files to Create

1. `adapters/cursor-rules/05-project-context.mdc.template`

### Content Requirements (All Parameterized)

1. **Project Identity**:
   ```
   Project: {{PROJECT_NAME}}
   Tech Stack: {{TECH_STACK}}
   ```

2. **Module Structure** (project-specific, example):
   ```
   # Describe your project's module layout
   # This section is fully customizable
   ```

3. **Security Requirements** (optional section)

4. **Message Queues** (optional section)

5. **CLI Commands** (parameterized):
   ```bash
   # Linting
   {{LINTER_COMMAND}}
   
   # Tests
   {{TEST_COMMAND}}
   ```

6. **Key Documentation** table

7. **Project-Specific Failure Patterns** (FP-{PROJECT}-*):
   - Template for adding custom FPs

---

## Acceptance Criteria

- [ ] All values use `{{PLACEHOLDER}}` syntax
- [ ] Clear sections for customization
- [ ] Example content commented
- [ ] FP-{PROJECT}-* template included

---

## Notes

This is the ONLY cursor rule that projects should customize.
