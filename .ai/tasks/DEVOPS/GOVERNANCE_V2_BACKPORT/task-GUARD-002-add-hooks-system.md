# Task: GUARD-002 — Add hooks-system.md

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: RUNTIME_GUARDS  
> **Priority**: P1  
> **Status**: pending

---

## Description

Create the hooks-system.md runtime guard for parameterized quality hooks.

---

## Input Requirements

- Read callrelay source: `.ai/runtime/hooks-system.md`
- Generalize all PHP-specific content

---

## Output Requirements

### Files to Create

1. `core/runtime/hooks-system.md`

### Content Requirements

1. **Purpose**: Parameterized quality check system
2. **Configuration Schema**:
   ```yaml
   hooks:
     linter:
       tool: "{{LINTER}}"
       command: "{{LINTER_COMMAND}}"
     formatter:
       tool: "{{FORMATTER}}"
       command: "{{FORMATTER_COMMAND}}"
     tests:
       tool: "{{TEST_RUNNER}}"
       command: "{{TEST_COMMAND}}"
   ```
3. **Hook Integration Points**
4. **Parameterization Guide**
5. **Example Configurations** for common stacks:
   - TypeScript/ESLint
   - Python/Ruff
   - PHP/PHPStan
   - Go/golangci-lint

---

## Acceptance Criteria

- [ ] File created
- [ ] Fully parameterized
- [ ] Example configurations for 3+ stacks
- [ ] No hardcoded tool names

---

## Dependencies

- WDOC-005: 11_HOOKS.md reference
