# Task: WDOC-005 — Add 11_HOOKS.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: WORKFLOW_DOCS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create 11_HOOKS.md with parameterized quality hooks system.

---

## Input Requirements

- Read callrelay source: `.ai/_WORKFLOW/11_HOOKS.md`
- Generalize all PHP-specific to parameters

---

## Output Requirements

### Files to Create

1. `core/workflow/11_HOOKS.md`

### Content Requirements

1. **Purpose**: Quality checks agents/developers should run before commits

2. **Hook Types** (parameterized):
   | Type | Trigger | Tool | Command |
   |------|---------|------|---------|
   | Linter Check | After code edit | `{{LINTER}}` | `{{LINTER_COMMAND}}` |
   | Formatter | After code edit | `{{FORMATTER}}` | `{{FORMATTER_COMMAND}}` |
   | Secret Detection | Before commit | grep patterns | [pattern] |
   | Tests | Before commit | `{{TEST_RUNNER}}` | `{{TEST_COMMAND}}` |

3. **Hook Execution Matrix**:
   | Hook | IMPLEMENTER | FIXATOR | CODE_DOCUMENTATOR |
   |------|-------------|---------|-------------------|
   | Linter | MANDATORY | MANDATORY | OPTIONAL |
   | Formatter | RECOMMENDED | RECOMMENDED | N/A |
   | Secret Detection | MANDATORY | MANDATORY | MANDATORY |
   | Tests | RECOMMENDED | RECOMMENDED | N/A |

4. **Agent Responsibilities**: What to run after each action

5. **Secret Detection Rules**: Forbidden patterns (generic)

6. **Hook Compliance Declaration Template**

7. **Exemption Rules**

8. **Quick Reference Commands** (parameterized)

---

## Acceptance Criteria

- [ ] File created
- [ ] All commands parameterized (`{{LINTER}}`, etc.)
- [ ] Hook Execution Matrix
- [ ] Compliance Declaration template
- [ ] No project-specific content
