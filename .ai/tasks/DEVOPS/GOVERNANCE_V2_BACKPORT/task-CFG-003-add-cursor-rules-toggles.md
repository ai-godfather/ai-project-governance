# Task: CFG-003 — Add Cursor Rules Toggles

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CONFIG_SCHEMA  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Add enforcement toggles for cursor rules in governance.config.yaml.template.

---

## Output Requirements

### Files to Modify

1. `governance.config.yaml.template`

### Section Already Added in CFG-001

Ensure `enforcement.cursor_rules` section is complete:

```yaml
enforcement:
  cursor_rules:
    # Which MDC files to install
    workflow_enforcement: true         # 00-workflow-enforcement.mdc
    blocking_conditions: true          # 01-blocking-conditions.mdc
    pre_commit_checklist: true         # 02-pre-commit-checklist.mdc
    role_boundaries: true              # 04-role-boundaries.mdc
    failure_patterns_critical: true    # 03-failure-patterns-critical.mdc
    ui_browser_validator_enforcement: true  # 06-ui-browser-validator-enforcement.mdc
```

---

## Acceptance Criteria

- [ ] All 6 cursor rules have toggles
- [ ] Default is true (enabled)
- [ ] Comments reference file names
