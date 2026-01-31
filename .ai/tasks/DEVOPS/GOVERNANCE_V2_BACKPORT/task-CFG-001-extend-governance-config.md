# Task: CFG-001 — Extend governance.config.yaml v2.0

> **Feature**: DEVOPS_007 (Governance V2.0 Backport)  
> **Category**: CONFIG_SCHEMA  
> **Priority**: P0 (Critical)  
> **Status**: pending

---

## Description

Extend governance.config.yaml.template with v2.0 schema additions.

---

## Input Requirements

- Read existing: `governance.config.yaml.template`
- Review plan: GOVERNANCE_V2_BACKPORT_PLAN.md (config section)

---

## Output Requirements

### Files to Modify

1. `governance.config.yaml.template`

### New Sections to Add

```yaml
# v2.0 additions

governance:
  # v2.0 PLANNER enhancements
  planner:
    two_phase: true
    approval_gate: true
    prohibitions_count: 35
  
  # v2.0 AUDITOR configuration
  auditor:
    enabled: true
    audit_dimensions: 15
    blocking_checks:
      - api_schema
      - metric_definitions
      - task_count
      - entity_fields
      - ascii_mockup_coverage
  
  # v2.0 TDD configuration
  tdd:
    enabled: false                     # Optional by default
    framework: "{{TEST_FRAMEWORK}}"
    scope:
      - "tests/**/*"
  
  # v2.0 Documentation Gate
  documentation_gate:
    enabled: true
    blocking: true

# v2.0 Enforcement toggles
enforcement:
  cursor_rules:
    workflow_enforcement: true
    blocking_conditions: true
    pre_commit_checklist: true
    role_boundaries: true
    failure_patterns_critical: true
    ui_browser_validator_enforcement: true

# v2.0 Workflow definitions
workflows:
  executable_definitions: true

# v2.0 Modular roles
roles:
  modular_structure: true
  output_rules: true
  safeguards:
    - CODE_DOCUMENTATOR
```

---

## Acceptance Criteria

- [ ] All v2.0 sections added
- [ ] Placeholders use `{{}}` syntax
- [ ] Comments explain each option
- [ ] Backward compatible with v1.0 projects

---

## Dependencies

None
