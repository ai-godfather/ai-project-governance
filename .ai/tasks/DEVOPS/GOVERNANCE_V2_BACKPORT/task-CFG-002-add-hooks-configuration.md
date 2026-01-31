# Task: CFG-002 — Add Hooks Configuration Section

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CONFIG_SCHEMA  
> **Priority**: P1  
> **Status**: pending

---

## Description

Add parameterized hooks configuration to governance.config.yaml.template.

---

## Output Requirements

### Files to Modify

1. `governance.config.yaml.template`

### Section to Add

```yaml
# v2.0 Hooks configuration
hooks:
  enabled: false                       # Opt-in
  
  linter:
    tool: "{{LINTER}}"                 # phpstan, eslint, ruff, golangci-lint
    command: "{{LINTER_COMMAND}}"
    level: "{{LINTER_LEVEL}}"          # Optional: level 6, strict, etc.
  
  formatter:
    tool: "{{FORMATTER}}"              # prettier, black, gofmt
    command: "{{FORMATTER_COMMAND}}"
  
  tests:
    runner: "{{TEST_RUNNER}}"          # phpunit, jest, pytest, go test
    command: "{{TEST_COMMAND}}"
  
  # Pre-commit hooks
  pre_commit:
    linter: true
    formatter: false
    secret_detection: true
    tests: false
```

---

## Acceptance Criteria

- [ ] Hooks section added
- [ ] All tools parameterized
- [ ] Pre-commit configuration
- [ ] Examples in comments
